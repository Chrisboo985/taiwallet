// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation

enum SecretPhraseDataType {
    case words(words: [[WordIndex]])
    case privateKey(key: String)
}
