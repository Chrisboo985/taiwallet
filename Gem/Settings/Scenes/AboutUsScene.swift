// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation
import SwiftUI
import Settings
import Components
import GemstonePrimitives
import Components
import Style

struct AboutUsScene: View {

    let model = AboutUsViewModel()

    var body: some View {
        List {
            Section {
                NavigationCustomLink(with: ListItemView(title: Localized.Settings.termsOfServices)) {
                    UIApplication.shared.open(PublicConstants.url(.termsOfService))
                }
                NavigationCustomLink(with: ListItemView(title: Localized.Settings.privacyPolicy)) {
                    UIApplication.shared.open(PublicConstants.url(.privacyPolicy))
                }
                NavigationCustomLink(with: ListItemView(title: Localized.Settings.website)) {
                    UIApplication.shared.open(PublicConstants.url(.website))
                }
            }

            Section {
                ListItemView(
                    title: model.versionTextTitle,
                    subtitle: model.versionTextValue,
                    image: model.versionTextImage
                )
                .contextMenu {
                    ContextMenuCopy(
                        value: model.versionTextValue
                    )
                    ContextMenuItem(
                        title: model.contextDevTitle,
                        image: model.contextDeveloperImage,
                        action: onEnableDevSettings
                    )
                }
            }
        }
        .listStyle(.insetGrouped)
        .listSectionSpacing(.compact)
        .navigationTitle(Localized.Settings.aboutus)
    }
}

// MARK: - Actions

extension AboutUsScene {
    @MainActor
    private func onEnableDevSettings() {
        model.isDeveloperEnabled.toggle()
    }
}

struct AboutUsScene_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsScene()
    }
}

