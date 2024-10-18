// Copyright (c). TAIWallet Wallet. All rights reserved.

import SwiftUI

extension Int {
    var color: Color {
        let red = Double((self >> 16) & 0xFF) / 255.0
        let green = Double((self >> 8) & 0xFF) / 255.0
        let blue = Double(self & 0xFF) / 255.0

        return Color(red: red, green: green, blue: blue)
    }
    
    var uiColor: UIColor {
        let red = CGFloat((self >> 16) & 0xFF) / 255.0
        let green = CGFloat((self >> 8) & 0xFF) / 255.0
        let blue = CGFloat(self & 0xFF) / 255.0

        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
