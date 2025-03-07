// Copyright (c). TAIWallet Wallet. All rights reserved.

import SwiftUI

// MARK: - View builders

public extension View {
    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }

    @ViewBuilder
    func `if`<Content: View>(
        _ condition: Bool,
        content: (Self) -> Content
    ) -> some View {
        self.ifElse(condition, ifContent: content, elseContent: { _ in self })
    }

    @ViewBuilder
    func ifElse<TrueContent: View, FalseContent: View>(
        _ condition: Bool,
        ifContent: (Self) -> TrueContent,
        elseContent: (Self) -> FalseContent
    ) -> some View {
        if condition {
            ifContent(self)
        } else {
            elseContent(self)
        }
    }

    @ViewBuilder
    func ifLet<Wrapped, Content: View>(
        _ optional: Wrapped?,
        content: (Self, Wrapped) -> Content
    ) -> some View {
        if let value = optional {
            content(self, value)
        } else {
            self
        }
    }

    @ViewBuilder
    func ifLet<Wrapped, TrueContent: View, FalseContent: View>(
        _ optional: Wrapped?,
        ifContent: (Self, Wrapped) -> TrueContent,
        elseContent: (Self) -> FalseContent
    ) -> some View {
        if let value = optional {
            ifContent(self, value)
        } else {
            elseContent(self)
        }
    }
}

// MARK: - Confirmation Dialog

public extension View {
    func confirmationDialog<S, A, T>(
        _ title: S,
        presenting data: Binding<T?>,
        sensoryFeedback: SensoryFeedback? = nil,
        @ViewBuilder actions: (T) -> A)
    -> some View where S: StringProtocol, A: View {
        let isPresented: Binding<Bool> = Binding(
            get: { data.wrappedValue != nil },
            set: { newValue in
                guard !newValue else { return }
                data.wrappedValue = nil
            }
        )
        // confiramtion dialog works good only for iPhone, for different devices use an alert
        let iPhone = UIDevice.current.userInterfaceIdiom == .phone

        return ifElse(iPhone) {
            $0.confirmationDialog(
                    title,
                    isPresented: isPresented,
                    titleVisibility: .visible,
                    presenting: data.wrappedValue,
                    actions: actions
                )
        } elseContent: {
            $0.alert(
                    title,
                    isPresented: isPresented,
                    presenting: data.wrappedValue,
                    actions: actions
                )
        }
        .ifLet(sensoryFeedback) { view, value in
            view.sensoryFeedback(value, trigger: isPresented.wrappedValue) { $1 }
        }
    }
}

// MARK: - Sheet

public extension View {
    func sheet<A, T>(
        presenting data: Binding<T?>,
        sensoryFeedback: SensoryFeedback? = nil,
        onDismiss: (() -> Void)? = nil,
        @ViewBuilder content: @escaping (T) -> A
    ) -> some View where A: View {
        let isPresented = Binding<Bool>(
            get: { data.wrappedValue != nil },
            set: { newValue in
                guard !newValue else { return }
                data.wrappedValue = nil
            }
        )

        return sheet(
            isPresented: isPresented,
            onDismiss: onDismiss,
            content: {
                data.wrappedValue.map(content)
            }
        )
        .ifLet(sensoryFeedback) { view, value in
            view.sensoryFeedback(value, trigger: isPresented.wrappedValue) { $1 }
        }
    }
}
