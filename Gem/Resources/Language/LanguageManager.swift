// Copyright (c). Gem Wallet. All rights reserved.

import SwiftUICore

//class LanguageManager: ObservableObject {
//    @Published var currentLanguage: BaseLanguage
//    
//    fileprivate let _langMap = [
//        "en": BaseLanguage(),
//        "zh": SimplifiedChinese()
//    ]
//
//    init() {
//        let lang = Bundle.main.preferredLocalizations.first?.split(separator: "_").first?.split(separator: "-").first ?? "en"
//        self.currentLanguage = _langMap[String(lang)] ?? _langMap["en"]!
//    }
//
//    func setLanguage(_ languageCode: String) {
//        self.currentLanguage = _langMap[languageCode] ?? _langMap["en"]!
//    }
//    
//    @objc private func languageChanged() {
//        let preferredLanguage = Locale.preferredLanguages.first
//        debugPrint("语言偏好已更改为: \(preferredLanguage ?? "Unknown")")
//    }
//}
