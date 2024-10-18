import Keystore
import Primitives
import Store
import Style
import SwiftUI

@main
struct GemApp: App {
    @Environment(\.scenePhase) var scenePhase
    @StateObject var lang: BaseLanguage = {
            let langCode = Bundle.main.preferredLocalizations.first?.split(separator: "_").first?.split(separator: "-").first ?? "en"
            return langCode == "zh" ? SimplifiedChinese() : BaseLanguage()
        }()

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    @State var db = DB.main
    @State var lockManager = LockWindowManager(lockModel: LockSceneViewModel())

    init() {
        UNUserNotificationCenter.current().delegate = appDelegate
    }
    
    var body: some Scene {
        WindowGroup {
            WalletCoordinator(
                db: db
            )
            .databaseContext(.readWrite { db.dbQueue })
            .navigationBarTitleDisplayMode(.inline)
            .tint(Colors.black)
            .environmentObject(lang)
            .onAppear {
                lockManager.toggleLock(show: lockManager.showLockScreen)
            }
            .onChange(of: scenePhase) { _, newPhase in
                lockManager.setPhase(phase: newPhase)
            }
            .onChange(of: lockManager.isPrivacyLockVisible) { _, visible in
                lockManager.togglePrivacyLock(visible: visible)
            }
            .onChange(of: lockManager.showLockScreen) { _, showLockScreen in
                lockManager.toggleLock(show: showLockScreen)
            }
        }
    }
}

