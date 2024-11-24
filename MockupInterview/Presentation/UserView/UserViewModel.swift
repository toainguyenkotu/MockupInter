//
//  UserViewModel.swift
//  MockupInterview
//
//  Created by Toai NDT on 19/11/24.
//

import Foundation

final class UserViewModel: ViewModel, UserUseCase {
    var useGateway: UserGatewayProtocol

    init(useGateway: UserGatewayProtocol) {
        self.useGateway = useGateway
    }

    @Published var listUser: [User] = []
    @Published var enableLoadMore = false

    var limitItem = 50 // hard code to test

    @MainActor
    func getListUser(isRefresh: Bool = false) async {
        guard viewState == .loaded else { return }
        startLoading(isRefresh: isRefresh)
        do {
            listUser = try await getListUser(since: 1)
            enableLoadMore = listUser.count < limitItem
            endLoading(isRefresh: isRefresh)
        } catch {
            handleError(error)
        }
    }

    @MainActor
    func loadMoreListUser() async {
        guard viewState == .loaded else { return }
        do {
            startLoadMore()
            let result = try await getListUser(since: listUser.last?.id ?? 1)
            listUser.append(contentsOf: result)
            enableLoadMore = listUser.count < limitItem
            endLoadMore()
        } catch {
            handleError(error)
        }
    }
}
