// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation
import WalletCore
import WalletCorePrimitives
import BigInt
import Keystore
import Primitives
import Blockchain

public class SmartChainSigner: EthereumSigner {
    override public func signStake(input: SignerInput, privateKey: Data) throws -> String {
        guard let stakeType = input.type.stakeType else {
            throw AnyError("Invalid stake type")
        }

        let valueData: Data = switch stakeType {
        case .stake:
            input.value.magnitude.serialize()
        case .redelegate, .unstake, .rewards, .withdraw:
            Data()
        }

        let callData = try StakeHub().encodeStake(type: stakeType, amount: input.value)
        let data = try sign(coinType: input.coinType, input: buildBaseInput(
            input: input,
            transaction: .with {
                $0.contractGeneric = EthereumTransaction.ContractGeneric.with {
                    $0.amount = valueData
                    $0.data = callData
                }
            },
            toAddress: input.destinationAddress,
            privateKey: privateKey
        ))
        return data
    }
}
