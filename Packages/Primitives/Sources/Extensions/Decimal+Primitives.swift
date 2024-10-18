// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation

extension Decimal {
    public var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
