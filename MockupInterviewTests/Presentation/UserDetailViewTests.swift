//
//  UserDetailViewTests.swift
//  MockupInterviewTests
//
//  Created by Toai NDT on 23/11/24.
//

import XCTest
@testable import MockupInterview

final class UserDetailViewTests: XCTestCase {
    
    @MainActor
    func test_load_data_success() async {
        let viewModel = UserDetailViewModel(userDetailGateWay: UserDetailGatewayMockup())
        await viewModel.fetchUserInformation(login: "mojombo")
        XCTAssertEqual(viewModel.viewState, .loaded, "View will not show loading but it is'n")
        XCTAssertNil(viewModel.error)
        XCTAssertEqual(viewModel.userDetail.login, "mojombo")
    }
    
    @MainActor
    func test_load_data_fail() async {
        let viewModel = UserDetailViewModel(userDetailGateWay: UserDetailGatewayMockup(error: IDError(message: "Error")))
        await viewModel.fetchUserInformation(login: "mojombo")
        XCTAssertEqual(viewModel.viewState, .loaded, "View will not show loading but it is'n")
        XCTAssertEqual(viewModel.error?.errorDescription, "Error")
        XCTAssertEqual(viewModel.userDetail.id, 0)
    }
}
