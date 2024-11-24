//
//  RefreshableListView.swift
//  SwiftUICleanArchitect
//
//  Created by Toai NDT on 19/11/24.
//

import SwiftUI

public struct RefreshableListView<Content: View>: View {
    private var viewState: ViewState = .loaded
    private var enableLoadMore = true
    private var refreshAction: () async -> Void
    private var loadMoreAction: () -> Void
    private var content: () -> Content
    private let threshold: CGFloat = 50

    public init(viewState: ViewState,
                enableLoadMore: Bool,
                refreshAction: @escaping () async -> Void,
                loadMoreAction: @escaping () -> Void,
                @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.enableLoadMore = enableLoadMore
        self.refreshAction = refreshAction
        self.loadMoreAction = loadMoreAction
        self.viewState = viewState
    }

    @State private var needToLoadMore = false

    public var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVStack(spacing: 0) {
                    content()
                        .anchorPreference(key: OffsetBottomPreferenceKey.self, value: .bottom) {
                            geometry[$0].y
                        }
                }
            }
            .padding(.top, 1)
            .onPreferenceChange(OffsetBottomPreferenceKey.self) { offset in
                if offset < geometry.size.height - threshold,
                   viewState == .loaded,
                   enableLoadMore {
                    needToLoadMore = true
                }
                if needToLoadMore, Int(offset) == Int(geometry.size.height) {
                    needToLoadMore = false
                    loadMoreAction()
                }
            }
            .scrollIndicators(ScrollIndicatorVisibility.hidden)
            .refreshable {
                await Task {
                    await refreshAction()
                }.value
            }
        }
    }
}
