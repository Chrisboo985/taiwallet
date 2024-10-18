// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
enum Localized {
    enum Activity {
        /// Activity
        static let title = Localized.tr("Localizable", "activity.title", fallback: "Activity")
        enum EmptyState {
            /// No activity yet.
            static let message = Localized.tr("Localizable", "activity.empty_state.message", fallback: "No activity yet.")
        }
    }

    enum App {
        /// Gem
        static let name = Localized.tr("Localizable", "app.name", fallback: "Gem")
    }

    enum Asset {
        /// Balances
        static let balances = Localized.tr("Localizable", "asset.balances", fallback: "Balances")
        /// Circulating Supply
        static let circulatingSupply = Localized.tr("Localizable", "asset.circulating_supply", fallback: "Circulating Supply")
        /// Decimals
        static let decimals = Localized.tr("Localizable", "asset.decimals", fallback: "Decimals")
        /// Latest Transactions
        static let latestTransactions = Localized.tr("Localizable", "asset.latest_transactions", fallback: "Latest Transactions")
        /// Market Cap
        static let marketCap = Localized.tr("Localizable", "asset.market_cap", fallback: "Market Cap")
        /// Market Cap Rank
        static let marketCapRank = Localized.tr("Localizable", "asset.market_cap_rank", fallback: "Market Cap Rank")
        /// Name
        static let name = Localized.tr("Localizable", "asset.name", fallback: "Name")
        /// Price
        static let price = Localized.tr("Localizable", "asset.price", fallback: "Price")
        /// Symbol
        static let symbol = Localized.tr("Localizable", "asset.symbol", fallback: "Symbol")
        /// Token ID
        static let tokenId = Localized.tr("Localizable", "asset.token_id", fallback: "Token ID")
        /// Total Supply
        static let totalSupply = Localized.tr("Localizable", "asset.total_supply", fallback: "Total Supply")
        /// Trading Volume (24h)
        static let tradingVolume = Localized.tr("Localizable", "asset.trading_volume", fallback: "Trading Volume (24h)")
        /// View address on %@
        static func viewAddressOn(_ p1: Any) -> String {
            return Localized.tr("Localizable", "asset.view_address_on", String(describing: p1), fallback: "View address on %@")
        }

        /// View token on %@
        static func viewTokenOn(_ p1: Any) -> String {
            return Localized.tr("Localizable", "asset.view_token_on", String(describing: p1), fallback: "View token on %@")
        }

        enum Balances {
            /// Available
            static let available = Localized.tr("Localizable", "asset.balances.available", fallback: "Available")
            /// Reserved
            static let reserved = Localized.tr("Localizable", "asset.balances.reserved", fallback: "Reserved")
        }
    }

    enum Assets {
        /// Add Custom Token
        static let addCustomToken = Localized.tr("Localizable", "assets.add_custom_token", fallback: "Add Custom Token")
        /// Hidden
        static let hidden = Localized.tr("Localizable", "assets.hidden", fallback: "Hidden")
        /// No assets found
        static let noAssetsFound = Localized.tr("Localizable", "assets.no_assets_found", fallback: "No assets found")
        /// Select Asset
        static let selectAsset = Localized.tr("Localizable", "assets.select_asset", fallback: "Select Asset")
    }

    enum Banner {
        enum AccountActivation {
            /// The %@ network requires a one time fee of %@.
            static func description(_ p1: Any, _ p2: Any) -> String {
                return Localized.tr("Localizable", "banner.account_activation.description", String(describing: p1), String(describing: p2), fallback: "The %@ network requires a one time fee of %@.")
            }

            /// %@ Account Activation Fee
            static func title(_ p1: Any) -> String {
                return Localized.tr("Localizable", "banner.account_activation.title", String(describing: p1), fallback: "%@ Account Activation Fee")
            }
        }

        enum EnableNotifications {
            /// Stay on top of your wallet activity.
            static let description = Localized.tr("Localizable", "banner.enable_notifications.description", fallback: "Stay on top of your wallet activity.")
            /// Enable Notifications
            static let title = Localized.tr("Localizable", "banner.enable_notifications.title", fallback: "Enable Notifications")
        }

        enum Stake {
            /// Earn %@ rewards on your stake while you sleep.
            static func description(_ p1: Any) -> String {
                return Localized.tr("Localizable", "banner.stake.description", String(describing: p1), fallback: "Earn %@ rewards on your stake while you sleep.")
            }

            /// Start staking %@
            static func title(_ p1: Any) -> String {
                return Localized.tr("Localizable", "banner.stake.title", String(describing: p1), fallback: "Start staking %@")
            }
        }
    }

    enum Buy {
        /// Please enter amount to buy
        static let emptyAmount = Localized.tr("Localizable", "buy.empty_amount", fallback: "Please enter amount to buy")
        /// No quotes available
        static let noResults = Localized.tr("Localizable", "buy.no_results", fallback: "No quotes available")
        /// Rate
        static let rate = Localized.tr("Localizable", "buy.rate", fallback: "Rate")
        /// Buy %s
        static func title(_ p1: UnsafePointer<CChar>) -> String {
            return Localized.tr("Localizable", "buy.title", p1, fallback: "Buy %s")
        }

        enum Providers {
            /// Providers
            static let title = Localized.tr("Localizable", "buy.providers.title", fallback: "Providers")
        }
    }

    enum Charts {
        /// All
        static let all = Localized.tr("Localizable", "charts.all", fallback: "All")
        /// 1D
        static let day = Localized.tr("Localizable", "charts.day", fallback: "1D")
        /// 1H
        static let hour = Localized.tr("Localizable", "charts.hour", fallback: "1H")
        /// 1M
        static let month = Localized.tr("Localizable", "charts.month", fallback: "1M")
        /// 1W
        static let week = Localized.tr("Localizable", "charts.week", fallback: "1W")
        /// 1Y
        static let year = Localized.tr("Localizable", "charts.year", fallback: "1Y")
    }

    enum Common {
        /// Address
        static let address = Localized.tr("Localizable", "common.address", fallback: "Address")
        /// All
        static let all = Localized.tr("Localizable", "common.all", fallback: "All")
        /// Back
        static let back = Localized.tr("Localizable", "common.back", fallback: "Back")
        /// Cancel
        static let cancel = Localized.tr("Localizable", "common.cancel", fallback: "Cancel")
        /// Continue
        static let `continue` = Localized.tr("Localizable", "common.continue", fallback: "Continue")
        /// Copied: %@
        static func copied(_ p1: Any) -> String {
            return Localized.tr("Localizable", "common.copied", String(describing: p1), fallback: "Copied: %@")
        }

        /// Copy
        static let copy = Localized.tr("Localizable", "common.copy", fallback: "Copy")
        /// Delete
        static let delete = Localized.tr("Localizable", "common.delete", fallback: "Delete")
        /// Are sure you want to delete %s?
        static func deleteConfirmation(_ p1: UnsafePointer<CChar>) -> String {
            return Localized.tr("Localizable", "common.delete_confirmation", p1, fallback: "Are sure you want to delete %s?")
        }

        /// Done
        static let done = Localized.tr("Localizable", "common.done", fallback: "Done")
        /// Hide
        static let hide = Localized.tr("Localizable", "common.hide", fallback: "Hide")
        /// %d ms
        static func latencyInMs(_ p1: Int) -> String {
            return Localized.tr("Localizable", "common.latency_in_ms", p1, fallback: "%d ms")
        }

        /// Loading
        static let loading = Localized.tr("Localizable", "common.loading", fallback: "Loading")
        /// Manage
        static let manage = Localized.tr("Localizable", "common.manage", fallback: "Manage")
        /// Next
        static let next = Localized.tr("Localizable", "common.next", fallback: "Next")
        /// No
        static let no = Localized.tr("Localizable", "common.no", fallback: "No")
        /// No Results Found
        static let noResultsFound = Localized.tr("Localizable", "common.no_results_found", fallback: "No Results Found")
        /// Not Available
        static let notAvailable = Localized.tr("Localizable", "common.not_available", fallback: "Not Available")
        /// Open settings
        static let openSettings = Localized.tr("Localizable", "common.open_settings", fallback: "Open settings")
        /// Paste
        static let paste = Localized.tr("Localizable", "common.paste", fallback: "Paste")
        /// Phrase
        static let phrase = Localized.tr("Localizable", "common.phrase", fallback: "Phrase")
        /// Pin
        static let pin = Localized.tr("Localizable", "common.pin", fallback: "Pin")
        /// Pinned
        static let pinned = Localized.tr("Localizable", "common.pinned", fallback: "Pinned")
        /// Private Key
        static let privateKey = Localized.tr("Localizable", "common.private_key", fallback: "Private Key")
        /// Provider
        static let provider = Localized.tr("Localizable", "common.provider", fallback: "Provider")
        /// Recommended
        static let recommended = Localized.tr("Localizable", "common.recommended", fallback: "Recommended")
        /// %@ is required
        static func requiredField(_ p1: Any) -> String {
            return Localized.tr("Localizable", "common.required_field", String(describing: p1), fallback: "%@ is required")
        }

        /// Secret Recovery Phrase
        static let secretPhrase = Localized.tr("Localizable", "common.secret_phrase", fallback: "Secret Recovery Phrase")
        /// See All
        static let seeAll = Localized.tr("Localizable", "common.see_all", fallback: "See All")
        /// Share
        static let share = Localized.tr("Localizable", "common.share", fallback: "Share")
        /// Show %@
        static func show(_ p1: Any) -> String {
            return Localized.tr("Localizable", "common.show", String(describing: p1), fallback: "Show %@")
        }

        /// Try Again
        static let tryAgain = Localized.tr("Localizable", "common.try_again", fallback: "Try Again")
        /// Type
        static let type = Localized.tr("Localizable", "common.type", fallback: "Type")
        /// Unpin
        static let unpin = Localized.tr("Localizable", "common.unpin", fallback: "Unpin")
        /// URL
        static let url = Localized.tr("Localizable", "common.url", fallback: "URL")
        /// Wallet
        static let wallet = Localized.tr("Localizable", "common.wallet", fallback: "Wallet")
        /// Yes
        static let yes = Localized.tr("Localizable", "common.yes", fallback: "Yes")
    }

    enum Date {
        /// Today
        static let today = Localized.tr("Localizable", "date.today", fallback: "Today")
        /// Yesterday
        static let yesterday = Localized.tr("Localizable", "date.yesterday", fallback: "Yesterday")
    }

    enum Errors {
        /// Camera permission not granted. Please enable camera access in settings to scan QR code.
        static let cameraPermissionsNotGranted = Localized.tr("Localizable", "errors.camera_permissions_not_granted", fallback: "Camera permission not granted. Please enable camera access in settings to scan QR code.")
        /// Create Wallet Error: %s
        static func createWallet(_ p1: UnsafePointer<CChar>) -> String {
            return Localized.tr("Localizable", "errors.create_wallet", p1, fallback: "Create Wallet Error: %s")
        }

        /// Decoding Error
        static let decoding = Localized.tr("Localizable", "errors.decoding", fallback: "Decoding Error")
        /// Failed to decode the QR code. Please try again with a different QR code.
        static let decodingQr = Localized.tr("Localizable", "errors.decoding_qr", fallback: "Failed to decode the QR code. Please try again with a different QR code.")
        /// Error
        static let error = Localized.tr("Localizable", "errors.error", fallback: "Error")
        /// An error occurred!
        static let errorOccured = Localized.tr("Localizable", "errors.error_occured", fallback: "An error occurred!")
        /// Invalid address or name
        static let invalidAddressName = Localized.tr("Localizable", "errors.invalid_address_name", fallback: "Invalid address or name")
        /// Invalid amount
        static let invalidAmount = Localized.tr("Localizable", "errors.invalid_amount", fallback: "Invalid amount")
        /// Invalid %@ address
        static func invalidAssetAddress(_ p1: Any) -> String {
            return Localized.tr("Localizable", "errors.invalid_asset_address", String(describing: p1), fallback: "Invalid %@ address")
        }

        /// Invalid Network ID
        static let invalidNetworkId = Localized.tr("Localizable", "errors.invalid_network_id", fallback: "Invalid Network ID")
        /// Invalid URL
        static let invalidUrl = Localized.tr("Localizable", "errors.invalid_url", fallback: "Invalid URL")
        /// Not Supported
        static let notSupported = Localized.tr("Localizable", "errors.not_supported", fallback: "Not Supported")
        /// This device does not support QR code scanning. You can only select QR code image from library.
        static let notSupportedQr = Localized.tr("Localizable", "errors.not_supported_qr", fallback: "This device does not support QR code scanning. You can only select QR code image from library.")
        /// Permissions Not Granted
        static let permissionsNotGranted = Localized.tr("Localizable", "errors.permissions_not_granted", fallback: "Permissions Not Granted")
        /// Transfer Error: %s
        static func transfer(_ p1: UnsafePointer<CChar>) -> String {
            return Localized.tr("Localizable", "errors.transfer", p1, fallback: "Transfer Error: %s")
        }

        /// Transfer Error
        static let transferError = Localized.tr("Localizable", "errors.transfer_error", fallback: "Transfer Error")
        /// We are currently unable to calculate the network fee.
        static let unableEstimateNetworkFee = Localized.tr("Localizable", "errors.unable_estimate_network_fee", fallback: "We are currently unable to calculate the network fee.")
        /// Unknown
        static let unknown = Localized.tr("Localizable", "errors.unknown", fallback: "Unknown")
        /// An unknown error occurred. Please try again.
        static let unknownTryAgain = Localized.tr("Localizable", "errors.unknown_try_again", fallback: "An unknown error occurred. Please try again.")
        /// Validation Error: %s
        static func validation(_ p1: UnsafePointer<CChar>) -> String {
            return Localized.tr("Localizable", "errors.validation", p1, fallback: "Validation Error: %s")
        }

        enum Connections {
            /// User cancelled
            static let userCancelled = Localized.tr("Localizable", "errors.connections.user_cancelled", fallback: "User cancelled")
        }

        enum Import {
            /// Invalid Secret Phrase
            static let invalidSecretPhrase = Localized.tr("Localizable", "errors.import.invalid_secret_phrase", fallback: "Invalid Secret Phrase")
            /// Invalid Secret Phrase word: %@
            static func invalidSecretPhraseWord(_ p1: Any) -> String {
                return Localized.tr("Localizable", "errors.import.invalid_secret_phrase_word", String(describing: p1), fallback: "Invalid Secret Phrase word: %@")
            }
        }

        enum Swap {
            /// No quote data
            static let noQuoteData = Localized.tr("Localizable", "errors.swap.no_quote_data", fallback: "No quote data")
        }

        enum Token {
            /// Invalid Token ID
            static let invalidId = Localized.tr("Localizable", "errors.token.invalid_id", fallback: "Invalid Token ID")
            /// Invalid token metadata
            static let invalidMetadata = Localized.tr("Localizable", "errors.token.invalid_metadata", fallback: "Invalid token metadata")
            /// Unable to fetch token information: %@
            static func unableFetchTokenInformation(_ p1: Any) -> String {
                return Localized.tr("Localizable", "errors.token.unable_fetch_token_information", String(describing: p1), fallback: "Unable to fetch token information: %@")
            }
        }
    }

    enum FeeRate {
        /// %@ sat/B
        static func satB(_ p1: Any) -> String {
            return Localized.tr("Localizable", "fee_rate.satB", String(describing: p1), fallback: "%@ sat/B")
        }

        /// %@ sat/vB
        static func satvB(_ p1: Any) -> String {
            return Localized.tr("Localizable", "fee_rate.satvB", String(describing: p1), fallback: "%@ sat/vB")
        }
    }

    enum FeeRates {
        /// Fast
        static let fast = Localized.tr("Localizable", "fee_rates.fast", fallback: "Fast")
        /// Speed of transaction is determined by network fee paid to the network miners.
        static let info = Localized.tr("Localizable", "fee_rates.info", fallback: "Speed of transaction is determined by network fee paid to the network miners.")
        /// Normal
        static let normal = Localized.tr("Localizable", "fee_rates.normal", fallback: "Normal")
        /// Slow
        static let slow = Localized.tr("Localizable", "fee_rates.slow", fallback: "Slow")
    }

    enum Filter {
        /// Clear
        static let clear = Localized.tr("Localizable", "filter.clear", fallback: "Clear")
        /// Filters
        static let title = Localized.tr("Localizable", "filter.title", fallback: "Filters")
    }

    enum Library {
        /// Select from Photo Library
        static let selectFromPhotoLibrary = Localized.tr("Localizable", "library.select_from_photo_library", fallback: "Select from Photo Library")
    }

    enum Lock {
        /// 15 minutes
        static let fifteenMinutes = Localized.tr("Localizable", "lock.fifteen_minutes", fallback: "15 minutes")
        /// 5 minutes
        static let fiveMinutes = Localized.tr("Localizable", "lock.five_minutes", fallback: "5 minutes")
        /// Immediately
        static let immediately = Localized.tr("Localizable", "lock.immediately", fallback: "Immediately")
        /// 1 hour
        static let oneHour = Localized.tr("Localizable", "lock.one_hour", fallback: "1 hour")
        /// 1 minute
        static let oneMinute = Localized.tr("Localizable", "lock.one_minute", fallback: "1 minute")
        /// Privacy Lock
        static let privacyLock = Localized.tr("Localizable", "lock.privacy_lock", fallback: "Privacy Lock")
        /// Require authentication
        static let requireAuthentication = Localized.tr("Localizable", "lock.require_authentication", fallback: "Require authentication")
        /// 6 hours
        static let sixHours = Localized.tr("Localizable", "lock.six_hours", fallback: "6 hours")
        /// Unlock
        static let unlock = Localized.tr("Localizable", "lock.unlock", fallback: "Unlock")
    }

    enum Nodes {
        /// Gem Wallet Node
        static let gemWalletNode = Localized.tr("Localizable", "nodes.gem_wallet_node", fallback: "Gem Wallet Node")
        enum ImportNode {
            /// Chain ID
            static let chainId = Localized.tr("Localizable", "nodes.import_node.chain_id", fallback: "Chain ID")
            /// In Sync
            static let inSync = Localized.tr("Localizable", "nodes.import_node.in_sync", fallback: "In Sync")
            /// Latency
            static let latency = Localized.tr("Localizable", "nodes.import_node.latency", fallback: "Latency")
            /// Latest Block
            static let latestBlock = Localized.tr("Localizable", "nodes.import_node.latest_block", fallback: "Latest Block")
            /// Add node
            static let title = Localized.tr("Localizable", "nodes.import_node.title", fallback: "Add node")
        }
    }

    enum PriceAlerts {
        /// Price alert disabled for %@
        static func disabledFor(_ p1: Any) -> String {
            return Localized.tr("Localizable", "price_alerts.disabled_for", String(describing: p1), fallback: "Price alert disabled for %@")
        }

        /// Price alert enabled for %@
        static func enabledFor(_ p1: Any) -> String {
            return Localized.tr("Localizable", "price_alerts.enabled_for", String(describing: p1), fallback: "Price alert enabled for %@")
        }

        /// Get notified when there’s a significant price change in your favorite crypto assets.
        static let getNotifiedExplainMessage = Localized.tr("Localizable", "price_alerts.get_notified_explain_message", fallback: "Get notified when there’s a significant price change in your favorite crypto assets.")
        enum EmptyState {
            /// No price alerts added yet.
            static let message = Localized.tr("Localizable", "price_alerts.empty_state.message", fallback: "No price alerts added yet.")
        }
    }

    enum Receive {
        /// Receive %s
        static func title(_ p1: UnsafePointer<CChar>) -> String {
            return Localized.tr("Localizable", "receive.title", p1, fallback: "Receive %s")
        }
    }

    enum SecretPhrase {
        /// Save your Secret Phrase in a secure place
        /// that only you control.
        static let savePhraseSafely = Localized.tr("Localizable", "secret_phrase.save_phrase_safely", fallback: "Save your Secret Phrase in a secure place \nthat only you control.")
        enum Confirm {
            enum QuickTest {
                /// Complete this quick test to confirm you've saved everything correctly.
                static let title = Localized.tr("Localizable", "secret_phrase.confirm.quick_test.title", fallback: "Complete this quick test to confirm you've saved everything correctly.")
            }
        }

        enum DoNotShare {
            /// If someone has your secret phrase they will have full control of your wallet!
            static let description = Localized.tr("Localizable", "secret_phrase.do_not_share.description", fallback: "If someone has your secret phrase they will have full control of your wallet!")
            /// Do not share your Secret Phrase!
            static let title = Localized.tr("Localizable", "secret_phrase.do_not_share.title", fallback: "Do not share your Secret Phrase!")
        }
    }

    enum Settings {
        /// About Us
        static let aboutus = Localized.tr("Localizable", "settings.aboutus", fallback: "About Us")
        /// Community
        static let community = Localized.tr("Localizable", "settings.community", fallback: "Community")
        /// Currency
        static let currency = Localized.tr("Localizable", "settings.currency", fallback: "Currency")
        /// Developer
        static let developer = Localized.tr("Localizable", "settings.developer", fallback: "Developer")
        /// Enable Passcode
        static let enablePasscode = Localized.tr("Localizable", "settings.enable_passcode", fallback: "Enable Passcode")
        /// Enable %@
        static func enableValue(_ p1: Any) -> String {
            return Localized.tr("Localizable", "settings.enable_value", String(describing: p1), fallback: "Enable %@")
        }

        /// Help Center
        static let helpCenter = Localized.tr("Localizable", "settings.help_center", fallback: "Help Center")
        /// Language
        static let language = Localized.tr("Localizable", "settings.language", fallback: "Language")
        /// Privacy Policy
        static let privacyPolicy = Localized.tr("Localizable", "settings.privacy_policy", fallback: "Privacy Policy")
        /// Rate App
        static let rateApp = Localized.tr("Localizable", "settings.rate_app", fallback: "Rate App")
        /// Security
        static let security = Localized.tr("Localizable", "settings.security", fallback: "Security")
        /// Support
        static let support = Localized.tr("Localizable", "settings.support", fallback: "Support")
        /// Terms of Services
        static let termsOfServices = Localized.tr("Localizable", "settings.terms_of_services", fallback: "Terms of Services")
        /// Settings
        static let title = Localized.tr("Localizable", "settings.title", fallback: "Settings")
        /// Version
        static let version = Localized.tr("Localizable", "settings.version", fallback: "Version")
        /// Visit Website
        static let website = Localized.tr("Localizable", "settings.website", fallback: "Visit Website")
        enum Networks {
            /// Explorer
            static let explorer = Localized.tr("Localizable", "settings.networks.explorer", fallback: "Explorer")
            /// Source
            static let source = Localized.tr("Localizable", "settings.networks.source", fallback: "Source")
            /// Networks
            static let title = Localized.tr("Localizable", "settings.networks.title", fallback: "Networks")
        }

        enum Notifications {
            /// Notifications
            static let title = Localized.tr("Localizable", "settings.notifications.title", fallback: "Notifications")
        }

        enum PriceAlerts {
            /// Price Alerts
            static let title = Localized.tr("Localizable", "settings.price_alerts.title", fallback: "Price Alerts")
        }

        enum Security {
            /// Authentication
            static let authentication = Localized.tr("Localizable", "settings.security.authentication", fallback: "Authentication")
        }
    }

    enum SignMessage {
        /// Message
        static let message = Localized.tr("Localizable", "sign_message.message", fallback: "Message")
        /// Sign Message
        static let title = Localized.tr("Localizable", "sign_message.title", fallback: "Sign Message")
    }

    enum Social {
        /// CoinGecko
        static let coingecko = Localized.tr("Localizable", "social.coingecko", fallback: "CoinGecko")
        /// Discord
        static let discord = Localized.tr("Localizable", "social.discord", fallback: "Discord")
        /// Facebook
        static let facebook = Localized.tr("Localizable", "social.facebook", fallback: "Facebook")
        /// GitHub
        static let github = Localized.tr("Localizable", "social.github", fallback: "GitHub")
        /// Homepage
        static let homepage = Localized.tr("Localizable", "social.homepage", fallback: "Homepage")
        /// Links
        static let links = Localized.tr("Localizable", "social.links", fallback: "Links")
        /// Reddit
        static let reddit = Localized.tr("Localizable", "social.reddit", fallback: "Reddit")
        /// Telegram
        static let telegram = Localized.tr("Localizable", "social.telegram", fallback: "Telegram")
        /// X (formerly Twitter)
        static let x = Localized.tr("Localizable", "social.x", fallback: "X (formerly Twitter)")
        /// YouTube
        static let youtube = Localized.tr("Localizable", "social.youtube", fallback: "YouTube")
    }

    enum Stake {
        /// Activating
        static let activating = Localized.tr("Localizable", "stake.activating", fallback: "Activating")
        /// Active
        static let active = Localized.tr("Localizable", "stake.active", fallback: "Active")
        /// Active In
        static let activeIn = Localized.tr("Localizable", "stake.active_in", fallback: "Active In")
        /// APR %@
        static func apr(_ p1: Any) -> String {
            return Localized.tr("Localizable", "stake.apr", String(describing: p1), fallback: "APR %@")
        }

        /// Available In
        static let availableIn = Localized.tr("Localizable", "stake.available_in", fallback: "Available In")
        /// Awaiting Withdrawal
        static let awaitingWithdrawal = Localized.tr("Localizable", "stake.awaiting_withdrawal", fallback: "Awaiting Withdrawal")
        /// Deactivating
        static let deactivating = Localized.tr("Localizable", "stake.deactivating", fallback: "Deactivating")
        /// Inactive
        static let inactive = Localized.tr("Localizable", "stake.inactive", fallback: "Inactive")
        /// Lock Time
        static let lockTime = Localized.tr("Localizable", "stake.lock_time", fallback: "Lock Time")
        /// Minimum amount
        static let minimumAmount = Localized.tr("Localizable", "stake.minimum_amount", fallback: "Minimum amount")
        /// No active staking yet.
        static let noActiveStaking = Localized.tr("Localizable", "stake.no_active_staking", fallback: "No active staking yet.")
        /// Pending
        static let pending = Localized.tr("Localizable", "stake.pending", fallback: "Pending")
        /// Rewards
        static let rewards = Localized.tr("Localizable", "stake.rewards", fallback: "Rewards")
        /// Stake
        static let stake = Localized.tr("Localizable", "stake.stake", fallback: "Stake")
        /// Validator
        static let validator = Localized.tr("Localizable", "stake.validator", fallback: "Validator")
        /// Validators
        static let validators = Localized.tr("Localizable", "stake.validators", fallback: "Validators")
        /// Stake via Gem Wallet
        static let viagem = Localized.tr("Localizable", "stake.viagem", fallback: "Stake via Gem Wallet")
    }

    enum Swap {
        /// Approve %@ to Swap
        static func approveToken(_ p1: Any) -> String {
            return Localized.tr("Localizable", "swap.approve_token", String(describing: p1), fallback: "Approve %@ to Swap")
        }

        /// Approve %@ token for swap access.
        static func approveTokenPermission(_ p1: Any) -> String {
            return Localized.tr("Localizable", "swap.approve_token_permission", String(describing: p1), fallback: "Approve %@ token for swap access.")
        }

        /// Provider
        static let provider = Localized.tr("Localizable", "swap.provider", fallback: "Provider")
        /// You Pay
        static let youPay = Localized.tr("Localizable", "swap.you_pay", fallback: "You Pay")
        /// You Receive
        static let youReceive = Localized.tr("Localizable", "swap.you_receive", fallback: "You Receive")
    }

    enum Transaction {
        /// Date
        static let date = Localized.tr("Localizable", "transaction.date", fallback: "Date")
        /// Recipient
        static let recipient = Localized.tr("Localizable", "transaction.recipient", fallback: "Recipient")
        /// Sender
        static let sender = Localized.tr("Localizable", "transaction.sender", fallback: "Sender")
        /// Status
        static let status = Localized.tr("Localizable", "transaction.status", fallback: "Status")
        /// View on %@
        static func viewOn(_ p1: Any) -> String {
            return Localized.tr("Localizable", "transaction.view_on", String(describing: p1), fallback: "View on %@")
        }

        enum Status {
            /// Successful
            static let confirmed = Localized.tr("Localizable", "transaction.status.confirmed", fallback: "Successful")
            /// Failed
            static let failed = Localized.tr("Localizable", "transaction.status.failed", fallback: "Failed")
            /// Pending
            static let pending = Localized.tr("Localizable", "transaction.status.pending", fallback: "Pending")
            /// Reverted
            static let reverted = Localized.tr("Localizable", "transaction.status.reverted", fallback: "Reverted")
        }

        enum Title {
            /// Received
            static let received = Localized.tr("Localizable", "transaction.title.received", fallback: "Received")
            /// Sent
            static let sent = Localized.tr("Localizable", "transaction.title.sent", fallback: "Sent")
        }
    }

    enum Transfer {
        /// Address
        static let address = Localized.tr("Localizable", "transfer.address", fallback: "Address")
        /// Amount
        static let amount = Localized.tr("Localizable", "transfer.amount", fallback: "Amount")
        /// Balance: %@
        static func balance(_ p1: Any) -> String {
            return Localized.tr("Localizable", "transfer.balance", String(describing: p1), fallback: "Balance: %@")
        }

        /// Confirm
        static let confirm = Localized.tr("Localizable", "transfer.confirm", fallback: "Confirm")
        /// From
        static let from = Localized.tr("Localizable", "transfer.from", fallback: "From")
        /// Insufficient %@ balance.
        static func insufficientBalance(_ p1: Any) -> String {
            return Localized.tr("Localizable", "transfer.insufficient_balance", String(describing: p1), fallback: "Insufficient %@ balance.")
        }

        /// Insufficient %@ balance to cover network fees.
        static func insufficientNetworkFeeBalance(_ p1: Any) -> String {
            return Localized.tr("Localizable", "transfer.insufficient_network_fee_balance", String(describing: p1), fallback: "Insufficient %@ balance to cover network fees.")
        }

        /// Max
        static let max = Localized.tr("Localizable", "transfer.max", fallback: "Max")
        /// Memo
        static let memo = Localized.tr("Localizable", "transfer.memo", fallback: "Memo")
        /// Minimum Amount is %@
        static func minimumAmount(_ p1: Any) -> String {
            return Localized.tr("Localizable", "transfer.minimum_amount", String(describing: p1), fallback: "Minimum Amount is %@")
        }

        /// Network
        static let network = Localized.tr("Localizable", "transfer.network", fallback: "Network")
        /// Network Fee
        static let networkFee = Localized.tr("Localizable", "transfer.network_fee", fallback: "Network Fee")
        /// Step %d
        static func step(_ p1: Int) -> String {
            return Localized.tr("Localizable", "transfer.step", p1, fallback: "Step %d")
        }

        /// Transfer
        static let title = Localized.tr("Localizable", "transfer.title", fallback: "Transfer")
        /// To
        static let to = Localized.tr("Localizable", "transfer.to", fallback: "To")
        enum Amount {
            /// Amount
            static let title = Localized.tr("Localizable", "transfer.amount.title", fallback: "Amount")
        }

        enum Approve {
            /// Approve
            static let title = Localized.tr("Localizable", "transfer.approve.title", fallback: "Approve")
        }

        enum ClaimRewards {
            /// Claim Rewards
            static let title = Localized.tr("Localizable", "transfer.claim_rewards.title", fallback: "Claim Rewards")
        }

        enum Confirm {
            /// Max total
            static let maxtotal = Localized.tr("Localizable", "transfer.confirm.maxtotal", fallback: "Max total")
        }

        enum Recipient {
            /// Address or Name
            static let addressField = Localized.tr("Localizable", "transfer.recipient.address_field", fallback: "Address or Name")
            /// Recipient
            static let title = Localized.tr("Localizable", "transfer.recipient.title", fallback: "Recipient")
        }

        enum Redelegate {
            /// Redelegate
            static let title = Localized.tr("Localizable", "transfer.redelegate.title", fallback: "Redelegate")
        }

        enum Rewards {
            /// Rewards
            static let title = Localized.tr("Localizable", "transfer.rewards.title", fallback: "Rewards")
        }

        enum Send {
            /// Send
            static let title = Localized.tr("Localizable", "transfer.send.title", fallback: "Send")
        }

        enum Stake {
            /// Stake
            static let title = Localized.tr("Localizable", "transfer.stake.title", fallback: "Stake")
        }

        enum Unstake {
            /// Unstake
            static let title = Localized.tr("Localizable", "transfer.unstake.title", fallback: "Unstake")
        }

        enum Withdraw {
            /// Withdraw
            static let title = Localized.tr("Localizable", "transfer.withdraw.title", fallback: "Withdraw")
        }
    }

    enum UpdateApp {
        /// Update
        static let action = Localized.tr("Localizable", "update_app.action", fallback: "Update")
        /// Version %@ of the app is now available. Update and enjoy the latest features and improvements.
        static func description(_ p1: Any) -> String {
            return Localized.tr("Localizable", "update_app.description", String(describing: p1), fallback: "Version %@ of the app is now available. Update and enjoy the latest features and improvements.")
        }

        /// New update available!
        static let title = Localized.tr("Localizable", "update_app.title", fallback: "New update available!")
    }

    enum Wallet {
        /// Buy
        static let buy = Localized.tr("Localizable", "wallet.buy", fallback: "Buy")
        /// Copy Address
        static let copyAddress = Localized.tr("Localizable", "wallet.copy_address", fallback: "Copy Address")
        /// Create a New Wallet
        static let createNewWallet = Localized.tr("Localizable", "wallet.create_new_wallet", fallback: "Create a New Wallet")
        /// Wallet #%d
        static func defaultName(_ p1: Int) -> String {
            return Localized.tr("Localizable", "wallet.default_name", p1, fallback: "Wallet #%d")
        }

        /// %@ Wallet #%d
        static func defaultNameChain(_ p1: Any, _ p2: Int) -> String {
            return Localized.tr("Localizable", "wallet.default_name_chain", String(describing: p1), p2, fallback: "%@ Wallet #%d")
        }

        /// Import an Existing Wallet
        static let importExistingWallet = Localized.tr("Localizable", "wallet.import_existing_wallet", fallback: "Import an Existing Wallet")
        /// Manage Token List
        static let manageTokenList = Localized.tr("Localizable", "wallet.manage_token_list", fallback: "Manage Token List")
        /// Multi-Coin
        static let multicoin = Localized.tr("Localizable", "wallet.multicoin", fallback: "Multi-Coin")
        /// Name
        static let name = Localized.tr("Localizable", "wallet.name", fallback: "Name")
        /// Receive
        static let receive = Localized.tr("Localizable", "wallet.receive", fallback: "Receive")
        /// Scan
        static let scan = Localized.tr("Localizable", "wallet.scan", fallback: "Scan")
        /// Scan QR Code
        static let scanQrCode = Localized.tr("Localizable", "wallet.scan_qr_code", fallback: "Scan QR Code")
        /// Send
        static let send = Localized.tr("Localizable", "wallet.send", fallback: "Send")
        /// Stake
        static let stake = Localized.tr("Localizable", "wallet.stake", fallback: "Stake")
        /// Swap
        static let swap = Localized.tr("Localizable", "wallet.swap", fallback: "Swap")
        /// Wallet
        static let title = Localized.tr("Localizable", "wallet.title", fallback: "Wallet")
        enum AddToken {
            /// Add Token
            static let title = Localized.tr("Localizable", "wallet.add_token.title", fallback: "Add Token")
        }

        enum Import {
            /// Import
            static let action = Localized.tr("Localizable", "wallet.import.action", fallback: "Import")
            /// Address or Name
            static let addressField = Localized.tr("Localizable", "wallet.import.address_field", fallback: "Address or Name")
            /// Contract Address or Token ID
            static let contractAddressField = Localized.tr("Localizable", "wallet.import.contract_address_field", fallback: "Contract Address or Token ID")
            /// %s encoded private key
            static func privateKey(_ p1: UnsafePointer<CChar>) -> String {
                return Localized.tr("Localizable", "wallet.import.private_key", p1, fallback: "%s encoded private key")
            }

            /// Secret Recovery Phrase
            static let secretPhrase = Localized.tr("Localizable", "wallet.import.secret_phrase", fallback: "Secret Recovery Phrase")
            /// Import Wallet
            static let title = Localized.tr("Localizable", "wallet.import.title", fallback: "Import Wallet")
        }

        enum New {
            /// Confirm that you've written down and stored your Secret Recovery Phrase securely before proceeding, as it is crucial for future wallet access and recovery.
            static let backupConfirmWarning = Localized.tr("Localizable", "wallet.new.backup_confirm_warning", fallback: "Confirm that you've written down and stored your Secret Recovery Phrase securely before proceeding, as it is crucial for future wallet access and recovery.")
            /// Write down your unique Secret Recovery Phrase and store it securely; it's essential for wallet access and recovery.
            static let backupWarning = Localized.tr("Localizable", "wallet.new.backup_warning", fallback: "Write down your unique Secret Recovery Phrase and store it securely; it's essential for wallet access and recovery.")
            /// New Wallet
            static let title = Localized.tr("Localizable", "wallet.new.title", fallback: "New Wallet")
        }

        enum Receive {
            /// No destination tag required
            static let noDestinationTagRequired = Localized.tr("Localizable", "wallet.receive.no_destination_tag_required", fallback: "No destination tag required")
            /// No memo required
            static let noMemoRequired = Localized.tr("Localizable", "wallet.receive.no_memo_required", fallback: "No memo required")
        }

        enum Watch {
            enum Tooltip {
                /// You are watching this wallet.
                static let title = Localized.tr("Localizable", "wallet.watch.tooltip.title", fallback: "You are watching this wallet.")
            }
        }
    }

    enum WalletConnect {
        /// App
        static let app = Localized.tr("Localizable", "wallet_connect.app", fallback: "App")
        /// WalletConnect
        static let brandName = Localized.tr("Localizable", "wallet_connect.brand_name", fallback: "WalletConnect")
        /// Disconnect
        static let disconnect = Localized.tr("Localizable", "wallet_connect.disconnect", fallback: "Disconnect")
        /// No active connections
        static let noActiveConnections = Localized.tr("Localizable", "wallet_connect.no_active_connections", fallback: "No active connections")
        /// WalletConnect
        static let title = Localized.tr("Localizable", "wallet_connect.title", fallback: "WalletConnect")
        /// Website
        static let website = Localized.tr("Localizable", "wallet_connect.website", fallback: "Website")
        enum Connect {
            /// Connect
            static let title = Localized.tr("Localizable", "wallet_connect.connect.title", fallback: "Connect")
        }

        enum Connection {
            /// Connection
            static let title = Localized.tr("Localizable", "wallet_connect.connection.title", fallback: "Connection")
        }
    }

    enum Wallets {
        /// Wallets
        static let title = Localized.tr("Localizable", "wallets.title", fallback: "Wallets")
        /// Watch
        static let watch = Localized.tr("Localizable", "wallets.watch", fallback: "Watch")
    }

    enum Welcome {
        /// Welcome to Gem Family
        static let title = Localized.tr("Localizable", "welcome.title", fallback: "Welcome to Gem Family")
        enum Legal {
            /// By using Gem, you agree to accept our
            ///  [Terms of Use](%s) and [Privacy Policy](%s)
            static func concent(_ p1: UnsafePointer<CChar>, _ p2: UnsafePointer<CChar>) -> String {
                return Localized.tr("Localizable", "welcome.legal.concent", p1, p2, fallback: "By using Gem, you agree to accept our\n [Terms of Use](%s) and [Privacy Policy](%s)")
            }
        }
    }
}

// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Localized {
    private static func tr(_ table: String, _ key: String, _ args: any CVarArg..., fallback value: String) -> String {
        let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
        return String(format: format, locale: Locale.current, arguments: args)
    }
}

// swiftlint:disable convenience_type
private final class BundleToken {
    static let bundle: Bundle = {
        #if SWIFT_PACKAGE
        return Bundle.module
        #else
        return Bundle(for: BundleToken.self)
        #endif
    }()
}

// swiftlint:enable convenience_type
