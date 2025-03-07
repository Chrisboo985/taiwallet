// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation

enum QRScannerState: Sendable {
    case idle
    case failure(error: QRScannerError)
    case scanning
}
