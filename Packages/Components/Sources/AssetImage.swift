// Copyright (c). TAIWallet Wallet. All rights reserved.

import SwiftUI

public struct AssetImage {
    public let type: String
    public let imageURL: URL?
    public let placeholder: Image?
    public let chainPlaceholder: Image?

    public init(type: String, imageURL: URL?, placeholder: Image?, chainPlaceholder: Image?) {
        self.type = type
        self.imageURL = imageURL
        self.placeholder = placeholder
        self.chainPlaceholder = chainPlaceholder
    }

    public static func resourceImage(image: String) -> AssetImage {
        return AssetImage(
            type: "",
            imageURL: .none,
            placeholder: Image(image),
            chainPlaceholder: .none
        )
    }
}
