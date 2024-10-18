// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation

extension WalletConnectionSessionProposal: Identifiable {
    public var id: String { metadata.url }
}
