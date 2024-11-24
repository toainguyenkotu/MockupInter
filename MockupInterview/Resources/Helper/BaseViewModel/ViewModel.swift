//
//  ViewModel.swift
//  SwiftUICleanArchitect
//
//  Created by Toai NDT on 22/11/24.
//

import Combine
import SwiftUI

public enum ViewState {
    case loaded, loading, loadMore, reloading
}

open class ViewModel: ObservableObject {
    public init() {}

    @Published open var error: IDError? {
        didSet {
            if error != nil {
                viewState = .loaded
            }
        }
    }

    @Published open var viewState: ViewState = .loaded

    // MARK: - Loading

    @ThreadSafe private var currentAPILoadingCount = 0 {
        didSet {
            if currentAPILoadingCount > 0 {
                viewState = .loading
            } else {
                viewState = .loaded
            }
        }
    }

    // MARK: - Refresh

    @ThreadSafe private var currentAPIReloadingCount = 0 {
        didSet {
            if currentAPIReloadingCount > 0 {
                viewState = .reloading
            } else {
                viewState = .loaded
            }
        }
    }

    open func startLoading(isRefresh: Bool = false) {
        if !isRefresh {
            currentAPILoadingCount += 1
        } else {
            currentAPIReloadingCount += 1
        }
    }

    open func endLoading(isRefresh: Bool = false) {
        if !isRefresh, currentAPILoadingCount != 0 {
            currentAPILoadingCount -= 1
        }
        if isRefresh, currentAPIReloadingCount != 0 {
            currentAPIReloadingCount -= 1
        }
        viewState = .loaded
    }

    // MARK: - Loadmore

    @ThreadSafe private var currentAPILoadMoreCount = 0 {
        didSet {
            if currentAPILoadMoreCount > 0 {
                viewState = .loadMore
            } else {
                viewState = .loaded
            }
        }
    }

    open func startLoadMore() {
        currentAPILoadMoreCount += 1
    }

    open func endLoadMore() {
        if currentAPILoadMoreCount == 0 {
            viewState = .loaded
        } else {
            currentAPILoadMoreCount -= 1
        }
    }

    // MARK: - HandleError

    open func handleError(_ error: Error) {
        currentAPILoadingCount = 0
        currentAPILoadMoreCount = 0
        if let err = error as? IDError {
            self.error = err
        } else if let error = error as? APIErrorBase {
            self.error = IDError(message: error.errorDescription)
        } else {
            self.error = IDError(message: error.localizedDescription)
        }
    }
}
