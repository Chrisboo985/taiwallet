// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation
import GRDB

struct AssetRecordInfo: FetchableRecord, Codable {
    var asset: AssetRecord
    var price: PriceRecord?
    var account: AccountRecord
    var balance: AssetBalanceRecord?
    var details: AssetDetailsRecord?
    var priceAlert: PriceAlertRecord?
    //var priceAlerts: [PriceAlertRecord]?
}

struct AssetRecordInfoMinimal: FetchableRecord, Codable {
    var price: PriceRecord?
    var balance: AssetBalanceRecord
}
