// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation
@preconcurrency import WalletConnector
import Keystore
import Store
import Primitives
import BigInt
import Gemstone

public final class WalletConnectorSigner: WalletConnectorSignable {
    let store: ConnectionsStore
    let keystore: any Keystore
    var walletConnectorInteractor: any WalletConnectorInteractable

    init(
        store: ConnectionsStore,
        keystore: any Keystore,
        walletConnectorInteractor: any WalletConnectorInteractable
    ) {
        self.store = store
        self.keystore = keystore
        self.walletConnectorInteractor = walletConnectorInteractor
    }

    public var allChains: [Primitives.Chain]  {
        Config.shared.getWalletConnectConfig().chains.compactMap { Chain(rawValue: $0) }
    }

    public func getCurrentWallet() throws -> Wallet {
        try keystore.getCurrentWallet()
    }

    public func getWallet(id: WalletId) throws -> Wallet {
        try keystore.getWallet(id)
    }

    public func getChains(wallet: Wallet) -> [Primitives.Chain] {
        wallet.accounts.map { $0.chain }.asSet().intersection(allChains).asArray()
    }

    public func getAccounts(wallet: Wallet, chains: [Primitives.Chain]) -> [Primitives.Account] {
        wallet.accounts.filter { chains.contains($0.chain) }
    }

    public func getEvents() -> [WalletConnectionEvents] {
        WalletConnectionEvents.allCases
    }
    
    public func getMethods() -> [WalletConnectionMethods] {
        WalletConnectionMethods.allCases
    }

    public func sessionApproval(payload: WCPairingProposal) async throws -> WalletId {
        try await walletConnectorInteractor.sessionApproval(payload: payload)
    }
    
    public func signMessage(sessionId: String, chain: Chain, message: SignMessage) async throws -> String {
        let session = try store.getConnection(id: sessionId)
        let payload = SignMessagePayload(chain: chain, session: session.session, wallet: session.wallet, message: message)
        return try await walletConnectorInteractor.signMessage(payload: payload)
    }
    
    public func updateSessions(sessions: [WalletConnectionSession]) throws {
        if sessions.isEmpty {
            try? self.store.deleteAll()
        } else {
            let newSessionIds = sessions.map { $0.id }.asSet()
            let sessionIds = try self.store.getSessions().filter { $0.state == .active }.map { $0.id }.asSet()
            let deleteIds = sessionIds.subtracting(newSessionIds).asArray()

            try? self.store.delete(ids: deleteIds)

            for session in sessions {
                try? self.store.updateConnectionSession(session)
            }
        }
    }
    
    public func sessionReject(id: String, error: any Error) throws {
        try self.store.delete(ids: [id])
        walletConnectorInteractor.sessionReject(error: error)
    }
    
    public func signTransaction(sessionId: String, chain: Chain, transaction: WalletConnectorTransaction) async throws -> String {
        throw AnyError("Not supported yet")
    }
    
    public func sendTransaction(sessionId: String, chain: Chain, transaction: WalletConnectorTransaction) async throws -> String {
        let session = try store.getConnection(id: sessionId)
        let wallet = try keystore.getWallet(session.wallet.walletId)

        switch transaction {
        case .ethereum(let transaction):
            let address = transaction.to
            let value = try BigInt.fromHex(transaction.value ?? .zero)
            let gasLimit: BigInt? = {
                if let value = transaction.gasLimit {
                    return BigInt(hex: value)
                } else if let gas = transaction.gas {
                    return BigInt(hex: gas)
                }
                return .none
            }()
            
            let gasPrice: GasPriceType? = {
                if let maxFeePerGas = transaction.maxFeePerGas,
                   let maxPriorityFeePerGas = transaction.maxPriorityFeePerGas,
                   let maxFeePerGasBigInt = BigInt(hex: maxFeePerGas),
                   let maxPriorityFeePerGasBigInt = BigInt(hex: maxPriorityFeePerGas)
                {
                    return .eip1559(gasPrice: maxFeePerGasBigInt, minerFee: maxPriorityFeePerGasBigInt)
                }
                return .none
            }()
            let data: Data? = {
                if let data = transaction.data {
                    return Data(hex: data)
                }
                return .none
            }()
            
            let transferData = TransferData(
                type: .generic(asset: chain.asset, metadata: session.session.metadata, extra: TransferDataExtra(
                    gasLimit: gasLimit,
                    gasPrice: gasPrice,
                    data: data
                )),
                recipientData: RecipientData(
                    asset: chain.asset,
                    recipient: Recipient(name: .none, address: address, memo: .none)
                ),
                value: value,
                canChangeValue: false
            )

            return try await walletConnectorInteractor.sendTransaction(transferData: WCTransferData(tranferData: transferData, wallet: wallet))
        case .solana(let data):
            let transferData = TransferData(
                type: .generic(asset: chain.asset, metadata: session.session.metadata, extra: TransferDataExtra(data: data.data(using: .utf8))),
                recipientData: RecipientData(
                    asset: chain.asset,
                    recipient: Recipient(name: .none, address: "", memo: .none)
                ),
                value: .zero,
                canChangeValue: false
            )
            return try await walletConnectorInteractor.sendTransaction(transferData: WCTransferData(tranferData: transferData, wallet: wallet))
        }
    }
    
    public func sendRawTransaction(sessionId: String, chain: Chain, transaction: String) async throws -> String {
        throw AnyError("Not supported yet")
    }
}
