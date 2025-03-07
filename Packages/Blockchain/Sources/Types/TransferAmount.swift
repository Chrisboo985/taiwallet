// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation
import BigInt

public struct TransferAmount: Equatable, Sendable {
    public let value: BigInt
    public let networkFee: BigInt
    public let useMaxAmount: Bool
    
    public init(
        value: BigInt,
        networkFee: BigInt,
        useMaxAmount: Bool
    ) {
        self.value = value
        self.networkFee = networkFee
        self.useMaxAmount = useMaxAmount
    }
}
