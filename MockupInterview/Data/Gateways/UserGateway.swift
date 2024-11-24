//
//  UserGateway.swift
//  MockupInterview
//
//  Created by Toai NDT on 20/11/24.
//

import Foundation

protocol UserGatewayProtocol {
    func getListUser(since: Int) async throws -> [User]
}

struct UserGateway: UserGatewayProtocol {
    func getListUser(since: Int) async throws -> [User] {
        let input = APIInput(endpoint: UserEndpoint(since: since), decodingType: [User].self)
        return try await APIService().request(input)
    }
}
