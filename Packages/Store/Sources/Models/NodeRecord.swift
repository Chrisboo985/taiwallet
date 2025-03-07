// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation
import Primitives
import GRDB

public struct NodeRecord: Codable, FetchableRecord, PersistableRecord  {
    
    public static let databaseTableName: String = "nodes"

    public var id: Int?
    public var url: String
    public var chain: Chain
    public var status: String
    public var priority: Int
}

extension NodeRecord: CreateTable {
    static func create(db: Database) throws {
        try db.create(table: Self.databaseTableName, ifNotExists: true) {
            $0.autoIncrementedPrimaryKey("id")
            $0.column("url", .text)
                .unique()
            $0.column("chain", .text)
                .notNull()
                .indexed()
            $0.column("status", .text)
            $0.column("priority", .integer)
        }
    }
}

extension NodeRecord {
    func mapToChainNode() -> ChainNode {
        return ChainNode(
            chain: chain.rawValue,
            node: mapToNode()
        )
    }
    
    func mapToNode() -> Node {
        return Node(
            url: url,
            status: NodeState(rawValue: status) ?? .inactive,
            priority: priority.asInt32
        )
    }
}

extension Node {
    func mapToRecord(chain: Chain) -> NodeRecord {
        return NodeRecord(
            url: url,
            chain: chain,
            status: status.rawValue,
            priority: Int(priority)
        )
    }
}
