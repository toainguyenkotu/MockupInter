//
//  UserDetailGatewayMockup.swift
//  MockupInterviewTests
//
//  Created by Toai NDT on 23/11/24.
//

@testable import MockupInterview

final class UserDetailGatewayMockup: UserDetailGatewayProtocol {
    let error: Error?
    
    init(error: Error? = nil) {
        self.error = error
    }
    
    
    func getUserInformation(login: String) async throws -> UserDetail {
        if let error = error { throw error }
        return UserDetailMock().mock() ?? UserDetail(
            id: 1,
            login: "mojombo",
            avatarUrl: "https://avatars.githubusercontent.com/u/1?v=4",
            htmlUrl: "https://github.com/mojombo",
            location: "San Francisco",
            followers: 23957,
            following: 11
        )
    }
}
