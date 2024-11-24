//
//  UserGatewayMock.swift
//  MockupInterviewTests
//
//  Created by Toai NDT on 23/11/24.
//

@testable import MockupInterview

final class UserGatewayMock: UserGatewayProtocol {
    let loadingError: Error?
    let loadMoreError: Error?
    let isEmpty: Bool?
    
    init(loadingError: Error? = nil, loadMoreError: Error? = nil, isEmpty: Bool? = nil) {
        self.loadingError = loadingError
        self.loadMoreError = loadMoreError
        self.isEmpty = isEmpty
    }
    
    func getListUser(since: Int) async throws -> [User] {
        if let loadingError = loadingError { throw loadingError }
        if isEmpty == true { return [] }
        if since != 1 {
            if let loadMoreError = loadMoreError {
                throw loadMoreError
            }
            return Array(UserMock().mock()?[20...39] ?? [])
        }
        return Array(UserMock().mock()?.prefix(20) ?? [])
    }
}
