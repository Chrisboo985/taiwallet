// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation
import SwiftUI

public extension NavigationPath {
    mutating func removeAll() {
        removeLast(self.count)
    }
}
