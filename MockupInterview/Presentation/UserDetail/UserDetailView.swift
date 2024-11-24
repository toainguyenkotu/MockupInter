//
//  UserDetailView.swift
//  MockupInterview
//
//  Created by Toai NDT on 22/11/24.
//

import SDWebImageSwiftUI
import SwiftUI

struct UserDetailView: View {
    let login: String

    init(login: String) {
        self.login = login
    }

    @StateObject private var viewModel = UserDetailViewModel(userDetailGateWay: UserDetailGateway())
    @EnvironmentObject private var coordinatorStack: Coordinator<UserCoordinatorPages>

    private let sizeItem = CGFloat(150).expectWidth()

    var body: some View {
        VStack(spacing: 0) {
            CardView(
                loginName: viewModel.userDetail.login,
                urlAvatarString: viewModel.userDetail.avatarUrl,
                otherInformationView: {
                    if let location = viewModel.userDetail.location, location.isNotEmpty {
                        return AnyView(LocationView(location: location))
                    }
                    return AnyView(EmptyView())
                }
            )
            .frame(maxHeight: .infinity, alignment: .topLeading)
            .frame(height: sizeItem)

            FollowView(
                numberFollower: viewModel.userDetail.followers,
                numberFollowing: viewModel.userDetail.following
            )
            .padding(.all, 20)

            BlogView(blogUrl: viewModel.userDetail.htmlUrl)
        }
        .opacity(viewModel.viewState == .loaded ? 1 : 0)
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(.all, 15)
        .navigationTitle(L10n.Navigation.User.details)
        .backButton {
            coordinatorStack.pop()
        }
        .onLoad {
            Task {
                await viewModel.fetchUserInformation(login: login)
            }
        }
        .onChange(of: viewModel.viewState) { newValue in
            coordinatorStack.showLoading = newValue
        }
        .onChange(of: viewModel.error) { _ in
            coordinatorStack.showAlert(message: viewModel.error?.message ?? L10n.Error.message) {
                coordinatorStack.pop()
            }
        }
    }
}
