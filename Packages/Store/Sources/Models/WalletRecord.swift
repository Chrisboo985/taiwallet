// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation
import Primitives
@preconcurrency import GRDB

public struct WalletRecord: Codable, TableRecord, FetchableRecord, PersistableRecord  {
    
    public static let databaseTableName: String = "wallets"

    public var id: String
    public var name: String
    public var type: String
    public var index: Int
    public var order: Int
    public var isPinned: Bool

    static let accounts = hasMany(AccountRecord.self).forKey("accounts")
    static let connection = hasOne(WalletConnectionRecord.self).forKey("connection")
}

extension WalletRecord: CreateTable {
    static func create(db: Database) throws {
        try db.create(table: Self.databaseTableName) {
            $0.column("id", .text)
                .primaryKey()
                .notNull()
            $0.column("name", .text)
                .notNull()
            $0.column("type", .text)
                .notNull()
            $0.column("index", .numeric)
                .notNull()
                .defaults(to: 0)
            $0.column("order", .numeric)
                .notNull()
                .defaults(to: 0)
            $0.column("isPinned", .boolean)
                .defaults(to: false)
        }
    }
}
