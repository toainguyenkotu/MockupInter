//
//  UserDetailUseCase.swift
//  MockupInterview
//
//  Created by Toai NDT on 23/11/24.
//

protocol UserDetailUseCase {
    var userDetailGateWay: UserDetailGatewayProtocol { get }
}

extension UserDetailUseCase {
    func getUserInformation(login: String) async throws -> UserDetail {
        try await userDetailGateWay.getUserInformation(login: login)
    }
}
