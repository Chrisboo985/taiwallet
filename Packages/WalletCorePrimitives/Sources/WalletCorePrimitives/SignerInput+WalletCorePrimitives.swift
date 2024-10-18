// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation
import WalletCore
import Primitives

public extension SignerInput {
    var coinType: WalletCore.CoinType {
        return asset.chain.coinType
    }
}
