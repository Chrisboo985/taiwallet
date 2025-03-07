// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation
import Primitives
import SwiftUI
import Style
import Components

struct ChainView: View {
    let chain: Chain

    var body: some View {
        ListItemView(
            title: Asset(chain).name,
            image: Image(chain.id),
            imageSize: Sizing.image.chain,
            cornerRadius: Sizing.image.chain/2
        )
    }
}
