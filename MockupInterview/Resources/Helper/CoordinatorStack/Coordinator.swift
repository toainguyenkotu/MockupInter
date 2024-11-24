//
//  Coordinator.swift
//  MockupInterview
//
//  Created by Toai NDT on 22/11/24.
//

import SwiftUI

final class Coordinator<CoordinatorPage: Coordinatable>: ObservableObject {
    struct AlertData {
        let title: String
        let message: String
        let buttonTitle: String
        let action: (() -> Void)?

        init(title: String, message: String, buttonTitle: String, action: (() -> Void)? = nil) {
            self.title = title
            self.message = message
            self.buttonTitle = buttonTitle
            self.action = action
        }
    }

    @Published var path: NavigationPath = .init()
    @Published var sheet: CoordinatorPage?
    @Published var fullScreenCover: CoordinatorPage?
    @Published var alert: AlertData?
    @Published var showLoading: ViewState = .loaded

    enum PushType {
        case link
        case sheet
        case fullScreenCover
    }

    enum PopType {
        case link(last: Int)
        case sheet
        case fullScreenCover
    }

    func push(_ page: CoordinatorPage, type: PushType = .link) {
        switch type {
        case .link:
            path.append(page)
        case .sheet:
            sheet = page
        case .fullScreenCover:
            fullScreenCover = page
        }
    }

    func pop(type: PopType = .link(last: 1)) {
        switch type {
        case let .link(last):
            path.removeLast(last)
        case .sheet:
            sheet = nil
        case .fullScreenCover:
            fullScreenCover = nil
        }
    }

    func popToRoot() {
        path.removeLast(path.count)
    }

    func openUrl(urlString: String) {
        if let url = URL(string: urlString), Utils.canOpenUrl(urlString) {
            guard let coordinatorPage = UserCoordinatorPages.openLink(url: url) as? CoordinatorPage else { return }
            fullScreenCover = coordinatorPage
        } else {
            showAlert(message: "The URL does not exist")
        }
    }

    func showAlert(title: String = "", message: String, buttonTitle: String = "OK", action: (() -> Void)? = nil) {
        alert = AlertData(title: title, message: message, buttonTitle: buttonTitle, action: action)
    }
}
