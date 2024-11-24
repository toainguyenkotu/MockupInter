//
//  CoordinatorPages.swift
//  MockupInterview
//
//  Created by Toai NDT on 22/11/24.
//

import SwiftUI

enum UserCoordinatorPages: Coordinatable {
    var id: UUID { .init() }

    case root
    case userDetail(login: String)
    case openLink(url: URL)

    var body: some View {
        switch self {
        case .root:
            UserView()
        case let .userDetail(login):
            UserDetailView(login: login)
        case let .openLink(url):
            SFSafariView(url: url)
                .ignoresSafeArea()
        }
    }
}
