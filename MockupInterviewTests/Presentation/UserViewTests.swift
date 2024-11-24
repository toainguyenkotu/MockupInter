//
//  UserViewTests.swift
//  MockupInterviewTests
//
//  Created by Toai NDT on 23/11/24.
//

import XCTest
@testable import MockupInterview

final class UserViewTests: XCTestCase {
    
    @MainActor
    func test_load_users_success_with_not_empty() async {
        let viewModel = UserViewModel(useGateway: UserGatewayMock())
        viewModel.limitItem = 15
        await viewModel.getListUser()
        XCTAssertEqual(viewModel.viewState, .loaded, "View will not show loading but it is'n")
        XCTAssertNil(viewModel.error)
        XCTAssertEqual(viewModel.listUser.count, 20)
        XCTAssertFalse(viewModel.enableLoadMore)
    }
    
    @MainActor
    func test_load_users_success_with_empty() async {
        let viewModel = UserViewModel(useGateway: UserGatewayMock(isEmpty: true))
        await viewModel.getListUser()
        XCTAssertEqual(viewModel.viewState, .loaded, "View will not show loading but it isn't")
        XCTAssertNil(viewModel.error)
        XCTAssertTrue(viewModel.listUser.isEmpty)
        XCTAssertTrue(viewModel.enableLoadMore)
    }
    
    @MainActor
    func test_load_users_fail() async {
        let viewModel = UserViewModel(useGateway: UserGatewayMock(loadingError: IDError(message: "Error")))
        await viewModel.getListUser()
        XCTAssertEqual(viewModel.viewState, .loaded, "View will not show loading but it isn't")
        XCTAssertNotNil(viewModel.error)
        XCTAssertEqual(viewModel.error?.errorDescription, "Error")
        XCTAssertTrue(viewModel.listUser.isEmpty)
        XCTAssertFalse(viewModel.enableLoadMore)
    }
    
    @MainActor
    func test_load_more_success() async {
        let viewModel = UserViewModel(useGateway: UserGatewayMock())
        viewModel.limitItem = 30
        await viewModel.getListUser()
        await viewModel.loadMoreListUser()
        XCTAssertEqual(viewModel.viewState, .loaded, "View will not show loading but it isn't")
        XCTAssertNil(viewModel.error)
        XCTAssertEqual(viewModel.listUser.count, 40, "The view model will have 40 users but it isn't")
        XCTAssertFalse(viewModel.enableLoadMore, "We can't load more list users but it isn't")
    }
    
    @MainActor
    func test_load_more_fail() async {
        let viewModel = UserViewModel(useGateway: UserGatewayMock(loadMoreError: IDError(message: "Error")))
        viewModel.limitItem = 30
        await viewModel.getListUser()
        XCTAssertNil(viewModel.error)
        XCTAssertEqual(viewModel.listUser.count, 20, "The view model will have 20 users but it isn't")
        XCTAssertTrue(viewModel.enableLoadMore, "We can't load more list users but it isn't")
        await viewModel.loadMoreListUser()
        XCTAssertEqual(viewModel.viewState, .loaded, "View will not show loading but it isn't")
        XCTAssertNotNil(viewModel.error)
        XCTAssertEqual(viewModel.error?.errorDescription, "Error")
        XCTAssertEqual(viewModel.listUser.count, 20, "The view model will have 20 users but it isn't")
        XCTAssertTrue(viewModel.enableLoadMore, "We can't load more list users but it isn't")
    }
}
