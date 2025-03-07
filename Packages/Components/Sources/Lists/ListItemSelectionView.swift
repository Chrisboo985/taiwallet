// Copyright (c). TAIWallet Wallet. All rights reserved.

import SwiftUI
import Style

public struct ListItemSelectionView<T: Hashable>: View {
    let title: String?
    let titleExtra: String?
    let subtitle: String?
    let subtitleExtra: String?
    let value: T?
    let selection: T?
    let action: ((T) -> Void)?

    let placeholders: [ListItemViewPlaceholderType]
    let selectionDirection: SelectionImageDirection

    public init(
        title: String?,
        titleExtra: String?,
        subtitle: String?,
        subtitleExtra: String?,
        placeholders: [ListItemViewPlaceholderType] = [],
        selectionDirection: SelectionImageDirection = .right,
        value: T,
        selection: T?,
        action: ((T) -> Void)?
    ) {
        self.title = title
        self.titleExtra = titleExtra
        self.subtitle = subtitle
        self.subtitleExtra = subtitleExtra
        self.placeholders = placeholders
        self.selectionDirection = selectionDirection
        self.value = value
        self.selection = selection
        self.action = action
    }

    public var body: some View {
         SelectionView(
             value: value,
             selection: selection,
             selectionDirection: selectionDirection,
             action: action
         ) {
             ListItemView(
                 title: title,
                 titleExtra: titleExtra,
                 subtitle: subtitle,
                 subtitleExtra: subtitleExtra,
                 placeholders: placeholders
             )
         }
     }
}
