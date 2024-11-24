//
//  UserEndpoint.swift
//  MockupInterview
//
//  Created by Toai NDT on 20/11/24.
//

final class UserEndpoint: Endpoint {
    init(since: Int) {
        let query = [
            "per_page": 20,
            "since": since
        ]
        super.init(urlString: API.Urls.listUser,
                   method: .get,
                   requireAccessToken: false,
                   queryItems: query)
    }
}
