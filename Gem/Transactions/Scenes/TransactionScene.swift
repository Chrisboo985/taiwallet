// Copyright (c). TAIWallet Wallet. All rights reserved.

import Foundation
import SwiftUI
import Components
import Style
import Store
import GRDB
import GRDBQuery
import Primitives

struct TransactionScene: View {
    
    @Query<TransactionsRequest>
    var transactions: [Primitives.TransactionExtended]
    
    var model: TransactionDetailViewModel {
        return TransactionDetailViewModel(
            model: TransactionViewModel(
                transaction: transactions.first!,
                formatter: .medium
            )
        )
    }
    
    let input: TransactionSceneInput
    
    init(
        input: TransactionSceneInput
    ) {
        self.input = input
        _transactions = Query(input.transactionRequest)
    }
    
    @State private var showShareSheet = false

    var body: some View {
        VStack {
            List {
                Section {
                    ListItemView(title: model.dateField, subtitle: model.date)
                    HStack(spacing: Spacing.small) {
                        ListItemView(
                            title: model.statusField,
                            subtitle: model.status,
                            subtitleStyle: model.statusTextStyle,
                            infoAction: onStatusInfo
                        )
                        switch model.statusType {
                        case .none:
                            EmptyView()
                        case .progressView:
                            LoadingView(tint: Colors.orange)
                        case .image(let image):
                            image
                        }
                    }
                    
                    if let participantField = model.participantField, let account = model.participantAccount {
                        AddressListItem(title: participantField, style: .short, account: account)
                    }
                    
                    if model.showMemoField {
                        MemoListItem(memo: model.memo)
                    }
                    if model.openNetwork {
                        NavigationLink(value: Scenes.Asset(asset: model.model.transaction.asset.chain.asset)) {
                            networkView
                        }
                    } else {
                        networkView
                    }
                    ListItemView(
                        title: model.networkFeeField,
                        subtitle: model.networkFeeText,
                        subtitleExtra: model.networkFeeFiatText,
                        infoAction: onNetworkFeeInfo
                    )
                } header: {
                    switch model.headerType {
                    case .amount:
                        HStack {
                            Spacer()
                            TransactionHeaderView(type: model.headerType)
                                .padding(.bottom, 16)
                            Spacer()
                        }
                    case .swap:
                        Section {
                            TransactionHeaderView(type: model.headerType)
                                .padding()
                        }
                        .frame(maxWidth: .infinity)
                        .textCase(nil)
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets())
                    }
                }
                
                Section {
                    NavigationOpenLink(
                        url: model.transactionExplorerUrl,
                        with: Text(model.transactionExplorerText)
                            .tint(Colors.black)
                    )
                }
            }
        }
        .background(Colors.grayBackground)
        .navigationTitle(model.title)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showShareSheet.toggle()
                } label: {
                    Image(systemName: SystemImage.share)
                }
            }
        }
        .sheet(isPresented: $showShareSheet) {
            ShareSheet(activityItems: [model.transactionExplorerUrl.absoluteString])
        }
    }
}

extension TransactionScene {
    private var networkView: some View {
        HStack {
            ListItemView(title: model.networkField, subtitle: model.network)
            AssetImageView(assetImage: model.networkAssetImage, size: Sizing.list.image)
        }
    }
}

// MARK: - Actions

extension TransactionScene {
    func onNetworkFeeInfo() {
        model.onNetworkFeeInfo()
    }

    func onStatusInfo() {
        model.onStatusInfo()
    }
}

