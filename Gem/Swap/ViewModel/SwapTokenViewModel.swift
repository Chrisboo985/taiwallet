// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation
import Primitives
import Components

struct SwapTokenViewModel {
    
    private let model: AssetDataViewModel
    private let formatter = ValueFormatter(style: .medium)
    
    public init(model: AssetDataViewModel) {
        self.model = model
    }

    var availableBalanceText: String {
        return Localized.Transfer.balance(model.availableBalanceText)
    }
    
    var assetImage: AssetImage {
        return model.assetImage
    }
    
    var symbol: String {
        return model.asset.symbol
    }
    
    func fiatBalance(amount: String) -> String {
        guard
            let value = try? formatter.inputNumber(from: amount, decimals: model.asset.decimals.asInt),
            let amount = try? formatter.double(from: value, decimals: model.asset.decimals.asInt),
            let price = model.priceViewModel.price else {
            return .empty
        }
        return model.priceViewModel.fiatAmountText(amount: price.price * amount)
    }
}
