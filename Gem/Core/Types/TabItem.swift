// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation

enum TabItem: Identifiable {
    case wallet
    case activity
    case discovery
    case settings

    var id: Self { self }
}
