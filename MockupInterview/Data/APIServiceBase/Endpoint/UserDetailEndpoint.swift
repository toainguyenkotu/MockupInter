//
//  UserDetailEndpoint.swift
//  MockupInterview
//
//  Created by Toai NDT on 22/11/24.
//

final class UserDetailEndpoint: Endpoint {
    init(login: String) {
        super.init(urlString: String(format: API.Urls.userDetail, "\(login)"),
                   method: .get,
                   requireAccessToken: false,
                   cachePolicy: .useProtocolCachePolicy)
    }
}
