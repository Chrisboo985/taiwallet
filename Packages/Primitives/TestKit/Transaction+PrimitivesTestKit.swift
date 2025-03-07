// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation
import Primitives

public extension Transaction {
    static func mock(
        type: TransactionType = .transfer,
        state: TransactionState = .confirmed,
        direction: TransactionDirection = .incoming
    ) -> Transaction {
        Transaction(
            id: "1",
            hash: "2",
            assetId: .mock(),
            from: "",
            to: "",
            contract: .none,
            type: type,
            state: state,
            blockNumber: "",
            sequence: "",
            fee: "",
            feeAssetId: .mock(),
            value: "",
            memo: .none,
            direction: direction,
            utxoInputs: [],
            utxoOutputs: [],
            metadata: .none,
            createdAt: .now
        )
    }
}
