// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation

public enum AnyError {
    case message(String)
    
    public init(_ message: String) {
        self = .message(message)
    }
}

extension AnyError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .message(let message):
            return message
        }
    }
}
