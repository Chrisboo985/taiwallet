// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation

public class WalletPreferencesStore {
    
    public var completeInitialLoadAssets: Bool {
        set { defaults.setValue(newValue, forKey: Keys.completeInitialLoadAssets) }
        get { defaults.bool(forKey: Keys.completeInitialLoadAssets) }
    }
    
    public var transactionsTimestamp: Int {
        set { defaults.setValue(newValue, forKey: Keys.transactionsTimestamp) }
        get { defaults.integer(forKey: Keys.transactionsTimestamp) }
    }
    
    public var assetsTimestamp: Int {
        set { defaults.setValue(newValue, forKey: Keys.assetsTimestamp) }
        get { defaults.integer(forKey: Keys.assetsTimestamp) }
    }
    
    private let defaults: UserDefaults
    
    struct Keys {
        static let assetsTimestamp = "assets_timestamp"
        static let transactionsForAsset = "transactions_for_asset_v1"
        static let transactionsTimestamp = "transactions_timestamp_v1"
        static let completeInitialLoadAssets = "complete_initial_load_assets"
    }
    
    public init(
        walletId: String
    ) {
        self.defaults = Self.suite(walletId: walletId)
    }
    
    static func suite(walletId: String) -> UserDefaults {
        return UserDefaults(suiteName: "wallet_preferences_\(walletId)_v2")!
    }
    
    // transactions
    public func setTransactionsForAssetTimestamp(assetId: String, value: Int) {
        return defaults.setValue(value, forKey: String(format: "%@_%@", Keys.transactionsForAsset, assetId))
    }
    
    public func transactionsForAssetTimestamp(assetId: String) -> Int {
        return defaults.integer(forKey: String(format: "%@_%@", Keys.transactionsForAsset, assetId))
    }
}
