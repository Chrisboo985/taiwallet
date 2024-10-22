// Copyright (c). Gem Wallet. All rights reserved.

import SwiftUI

struct NavigationControllerAccessor: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if let navigationController = uiViewController.navigationController {
            configure(navigationController)
        }
    }
}
