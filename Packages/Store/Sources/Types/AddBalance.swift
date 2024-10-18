// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation

public struct AddBalance {
    public let assetId: String
    public let isEnabled: Bool
    
    public init(assetId: String, isEnabled: Bool) {
        self.assetId = assetId
        self.isEnabled = isEnabled
    }
}

extension AddBalance {
    func mapToAssetBalanceRecord(walletId: String) -> AssetBalanceRecord {
        return AssetBalanceRecord(
            assetId: assetId,
            walletId: walletId,
            available: .zero,
            frozen: .zero,
            locked: .zero,
            staked: .zero,
            pending: .zero,
            rewards: .zero,
            reserved: .zero,
            isEnabled: isEnabled,
            isHidden: false,
            isPinned: false,
            total: 0,
            fiatValue: 0
        )
    }
}
