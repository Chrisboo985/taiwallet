// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation

extension Account: Identifiable {
    public var id: String {
        return "\(chain)\(address)"
    }
}

