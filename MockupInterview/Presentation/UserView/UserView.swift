//
//  UserView.swift
//  MockupInterview
//
//  Created by Toai NDT on 19/11/24.
//

import SDWebImageSwiftUI
import SwiftUI

struct UserView: View {
    @StateObject var viewModel = UserViewModel(useGateway: UserGateway())

    @EnvironmentObject private var coordinatorStack: Coordinator<UserCoordinatorPages>

    private let sizeItem = CGFloat(150).expectWidth()

    var body: some View {
        RefreshableListView(
            viewState: viewModel.viewState,
            enableLoadMore: viewModel.enableLoadMore,
            refreshAction: { await viewModel.getListUser(isRefresh: true) },
            loadMoreAction: { Task { await viewModel.loadMoreListUser() } }
        ) {
            ForEach(viewModel.listUser, id: \.id) { item in
                CardView(
                    loginName: item.login,
                    urlAvatarString: item.avatarUrl,
                    otherInformationView: {
                        LandingPageView(landingPageUrl: item.htmlUrl) {
                            coordinatorStack.openUrl(urlString: item.htmlUrl)
                        }
                    }
                )
                .frame(height: sizeItem)
                .onTapGesture {
                    coordinatorStack.push(.userDetail(login: item.login))
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
        }
        .navigationTitle(L10n.Navigation.user)
        .navigationBarTitleDisplayMode(.inline)
        .onLoad {
            Task {
                await viewModel.getListUser()
            }
        }
        .onChange(of: viewModel.error, perform: { _ in
            coordinatorStack.showAlert(
                title: L10n.error,
                message: viewModel.error?.errorDescription ?? L10n.Error.message
            )
        })
        .onChange(of: viewModel.viewState, perform: { newValue in
            DispatchQueue.main.async {
                coordinatorStack.showLoading = newValue
            }
        })
    }

    func firstLoadData() {
        Task {
            await viewModel.getListUser()
        }
    }
}
