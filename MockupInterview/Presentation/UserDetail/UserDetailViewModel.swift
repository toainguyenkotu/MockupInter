//
//  UserDetailViewModel.swift
//  MockupInterview
//
//  Created by Toai NDT on 22/11/24.
//

import SwiftUI

final class UserDetailViewModel: ViewModel, UserDetailUseCase {
    var userDetailGateWay: UserDetailGatewayProtocol

    init(userDetailGateWay: UserDetailGatewayProtocol) {
        self.userDetailGateWay = userDetailGateWay
    }

    @Published var userDetail = UserDetail()

    @MainActor
    func fetchUserInformation(login: String) async {
        guard viewState == .loaded else { return }
        startLoading()
        do {
            userDetail = try await getUserInformation(login: login)
            endLoading()
        } catch {
            handleError(error)
        }
    }
}
