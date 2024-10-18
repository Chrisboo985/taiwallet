// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation

public extension StakeChain {
    var chain: Chain {
        Chain(rawValue: self.rawValue)!
    }
}
