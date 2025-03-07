// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation

extension LockPeriod: CaseIterable {
    public static let allCases: [LockPeriod] = [.immediate, .oneMinute, .fiveMinutes, .fifteenMinutes, .oneHour, .sixHours]
}

extension LockPeriod: Identifiable {
    public var id: Self { self }
}
