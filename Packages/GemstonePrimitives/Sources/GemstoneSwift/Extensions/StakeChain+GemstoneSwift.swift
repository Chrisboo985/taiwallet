// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation
import Primitives
import Gemstone

extension StakeChain {
    public var canChangeAmountOnUnstake: Bool {
        Config.shared.getStakeConfig(chain: rawValue).changeAmountOnUnstake
    }
    
    public var supportRedelegate: Bool {
        Config.shared.getStakeConfig(chain: rawValue).redelegate
    }
}
