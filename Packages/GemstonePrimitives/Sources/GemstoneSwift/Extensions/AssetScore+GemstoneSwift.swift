// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation
import Primitives
import Gemstone

extension AssetScore {
    
    public static func defaultScore(chain: Chain) -> AssetScore {
        return AssetScore(
            rank: AssetScore.defaultRank(chain: chain).asInt32
        )
    }
    
    // from 0 to 100. anything below is 0 is not good
    public static func defaultRank(chain: Chain) -> Int {
        Gemstone.assetDefaultRank(chain: chain.id).asInt
    }
}
