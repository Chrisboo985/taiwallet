// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation
import Primitives

struct TransferDataViewModel {
    let data: TransferData

    init(data: TransferData) {
        self.data = data
    }

    var type: TransferDataType { data.type }
    var recipientData: RecipientData { data.recipientData }
    var recipient: Recipient { recipientData.recipient }
    var asset: Asset { recipientData.asset }
    var memo: String? { recipientData.recipient.memo }
    var chain: Chain { asset.chain }
    var chainType: ChainType { chain.type }
    var chainAsset: Asset { chain.asset }

    var title: String {
        switch type {
        case .transfer: Localized.Transfer.Send.title
        case .swap(_, _, let type):
            switch type {
            case .approval: Localized.Transfer.Approve.title
            case .swap: Localized.Wallet.swap
            }
        case .generic: Localized.Transfer.Approve.title
        case .stake(_, let type):
            switch type {
            case .stake: Localized.Transfer.Stake.title
            case .unstake: Localized.Transfer.Unstake.title
            case .redelegate: Localized.Transfer.Redelegate.title
            case .rewards: Localized.Transfer.ClaimRewards.title
            case .withdraw: Localized.Transfer.Withdraw.title
            }
        }
    }

    var recipientTitle: String {
        switch type {
        case .swap: Localized.Swap.provider
        case .stake: Localized.Stake.validator
        default: Localized.Transfer.to
        }
    }

    var recepientAccount: SimpleAccount {
        SimpleAccount(name: recipientName,
                      chain: chain,
                      address: recipient.address)
    }

    var appValue: String? {
        switch type {
        case .transfer,
            .swap,
            .stake: .none
        case .generic(_, let metadata, _):
            metadata.name
        }
    }

    var websiteURL: URL? {
        switch type {
        case .transfer,
            .swap,
            .stake: .none
        case .generic(_, let metadata, _):
            URL(string: metadata.url)
        }
    }

    var shouldShowMemo: Bool {
        switch type {
        case .transfer:
            return AssetViewModel(asset: asset).supportMemo
        case .swap, .generic, .stake:
            return false
        }
    }

    var shouldShowRecipient: Bool {
        switch type {
        case .stake(_, let stakeType):
            switch stakeType {
            case .stake, .unstake, .redelegate, .withdraw: true
            case .rewards: false
            }
        default: true
        }
    }
}


// MARK: - Private

extension TransferDataViewModel {
    private var recipientName: String? {
        switch type {
        case .transfer,
                .swap,
                .generic:
            recipient.name ?? recipient.address
        case .stake(_, let stakeType):
            switch stakeType {
            case .stake(let validator):
                validator.name
            case .unstake(let delegation):
                delegation.validator.name
            case .redelegate(_, let toValidator):
                toValidator.name
            case .withdraw(let delegation):
                delegation.validator.name
            case .rewards:
                    .none
            }
        }
    }
}
