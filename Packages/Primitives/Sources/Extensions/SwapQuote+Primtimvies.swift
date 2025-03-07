// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation
import BigInt

public extension SwapQuote {
    var toValue: BigInt {
        BigInt(stringLiteral: self.toAmount)
    }
}
