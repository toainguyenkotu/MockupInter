//
//  CoordinatorStack.swift
//  MockupInterview
//
//  Created by Toai NDT on 22/11/24.
//

import Foundation
import SwiftUI

struct CoordinatorStack<CoordinatePage: Coordinatable>: View {
    let root: CoordinatePage

    init(_ root: CoordinatePage) {
        self.root = root
    }

    @StateObject private var coordinator = Coordinator<CoordinatePage>()

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            root
                .navigationDestination(for: CoordinatePage.self) { $0 }
                .sheet(item: $coordinator.sheet) { $0 }
                .fullScreenCover(item: $coordinator.fullScreenCover) { $0 }
                .alert(
                    coordinator.alert?.title ?? "",
                    isPresented: $coordinator.alert.mappedToBool(),
                    actions: {
                        Button(coordinator.alert?.buttonTitle ?? L10n.ok, role: .cancel) {
                            coordinator.alert?.action?()
                        }
                    }, message: {
                        Text(coordinator.alert?.message ?? "")
                    }
                )
        }
        .loadingView(isShow: coordinator.showLoading == .loading)
        .environmentObject(coordinator)
    }
}
