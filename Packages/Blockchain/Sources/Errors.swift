// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation

public enum TokenValidationError: Error {
    case invalidTokenId
    case invalidMetadata
    case other(Error)
}
