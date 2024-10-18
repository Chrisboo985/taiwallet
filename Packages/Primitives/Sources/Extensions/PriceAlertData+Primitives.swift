// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation

extension PriceAlertData: Identifiable {
    public var id: String { asset.id.identifier }
}
