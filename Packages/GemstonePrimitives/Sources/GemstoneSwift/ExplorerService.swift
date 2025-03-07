// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation
import Gemstone
import Primitives
import WalletCore
import WalletCorePrimitives

public struct ExplorerService {
    
    private let storage: ExplorerStorable
    
    public init(storage: ExplorerStorable) {
        self.storage = storage
    }
    
    private func explorerNameOrDefault(chain: Chain) -> String {
        let name = storage.get(chain: chain)
        let explorers = Self.explorers(chain: chain)
        return explorers.first(where: { $0 == name }) ?? explorers.first!
    }
    
    public static func explorers(chain: Chain) -> [String] {
        Gemstone.Config.shared.getBlockExplorers(chain: chain.id)
    }
    
    public func transactionUrl(chain: Chain, hash: String) -> BlockExplorerLink {
        let name = explorerNameOrDefault(chain: chain)
        let explorer = Gemstone.Explorer(chain: chain.id)
        let url = URL(string: explorer.getTransactionUrl(explorerName: name, transactionId: hash))!
        return BlockExplorerLink(name: name, link: url.absoluteString)
    }

    public func addressUrl(chain: Chain, address: String) -> BlockExplorerLink {
        let name = explorerNameOrDefault(chain: chain)
        let explorer = Gemstone.Explorer(chain: chain.id)
        let url = URL(string: explorer.getAddressUrl(explorerName: name, address: address))!
        return BlockExplorerLink(name: name, link: url.absoluteString)
    }
    
    public func tokenUrl(chain: Chain, address: String) -> BlockExplorerLink? {
        let name = explorerNameOrDefault(chain: chain)
        let explorer = Gemstone.Explorer(chain: chain.id)
        if let tokenUrl = explorer.getTokenUrl(explorerName: name, address: address), let url = URL(string: tokenUrl) {
            return BlockExplorerLink(name: name, link: url.absoluteString)
        }
        return .none
    }
}

// MARK: - ExplorerStorable

extension ExplorerService: ExplorerStorable {
    public func set(chain: Primitives.Chain, name: String) {
        storage.set(chain: chain, name: name)
    }
    
    public func get(chain: Primitives.Chain) -> String? {
        storage.get(chain: chain)
    }
}
