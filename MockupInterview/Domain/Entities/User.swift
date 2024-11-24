//
//  User.swift
//  MockupInterview
//
//  Created by Toai NDT on 20/11/24.
//

import Foundation

struct User: Decodable {
    var id = 0
    var login = ""
    var avatarUrl = ""
    var htmlUrl = ""

    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarUrl = "avatar_url"
        case htmlUrl = "html_url"
    }
}
