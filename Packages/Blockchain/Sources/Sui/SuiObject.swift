// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation
import Gemstone

public struct SuiObject: Codable {
    public struct Data: Codable {
        let objectId: String
        let version: String
        let digest: String
    }
    public let data: Data
    
    var objectRef: SuiObjectRef {
        SuiObjectRef(
            objectId: data.objectId,
            digest: data.digest,
            version: UInt64(data.version)!
        )
    }
}
