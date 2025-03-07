// Copyright (c). TAIWallet Wallet. All rights reserved.

import Primitives

public struct WCPairingProposal {
    public let pairingId: String
    public let proposal: WalletConnectionSessionProposal
}

extension WCPairingProposal: Identifiable {
    public var id: String { pairingId }
}
