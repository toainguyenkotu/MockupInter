//
//  UserDetail.swift
//  MockupInterview
//
//  Created by Toai NDT on 22/11/24.
//

import Foundation

struct UserDetail: Decodable {
    var id = 0
    var login = " "
    var avatarUrl = ""
    var htmlUrl = ""
    var location: String?
    var followers = 0
    var following = 0

    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
        case htmlUrl = "html_url"
        case location
        case followers
        case following
    }
}
