//
//  UserDetailGateway.swift
//  MockupInterview
//
//  Created by Toai NDT on 23/11/24.
//

import Foundation

protocol UserDetailGatewayProtocol {
    func getUserInformation(login: String) async throws -> UserDetail
}

struct UserDetailGateway: UserDetailGatewayProtocol {
    func getUserInformation(login: String) async throws -> UserDetail {
        let input = APIInput(endpoint: UserDetailEndpoint(login: login), decodingType: UserDetail.self)
        return try await APIService().request(input)
    }
}
