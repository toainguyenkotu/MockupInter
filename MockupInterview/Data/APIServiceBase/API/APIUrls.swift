//
//  APIUrls.swift
//  FSStoreSwiftUI
//
//  Created by Toai NDT on 19/11/24.
//

enum API {
    static let host = "https://api.github.com/"

    enum Urls {
        static let listUser = host + "users"
        static let userDetail = host + "users/%@"
    }
}
