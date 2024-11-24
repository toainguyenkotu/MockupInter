//
//  UserUseCase.swift
//  MockupInterview
//
//  Created by Toai NDT on 20/11/24.
//

import Combine

protocol UserUseCase {
    var useGateway: UserGatewayProtocol { get }
}

extension UserUseCase {
    func getListUser(since: Int) async throws -> [User] {
        try await useGateway.getListUser(since: since)
    }
}
