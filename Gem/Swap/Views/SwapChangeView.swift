// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation
import SwiftUI

struct SwapChangeView: View {
    
    @Binding var fromId: String
    @Binding var toId: String
    
    var body: some View {
        Button {
            swap(&fromId, &toId)
        } label: {
            Image(.swapIcon)
        }
    }
}
