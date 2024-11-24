//
//  Endpoint.swift
//  MockupInterview
//
//  Created by Toai NDT on 19/11/24.
//

import Foundation

internal class Endpoint: BaseEndpoint {
    var urlString: String = ""
    var method: HTTPMethod = .get
    var requireAccessToken: Bool
    var headers: [String: Any]?
    var queryItems: [String: Any]?
    var body: [String: Any]?
    var cachePolicy: NSURLRequest.CachePolicy

    init(urlString: String,
         method: HTTPMethod,
         requireAccessToken: Bool,
         headers: [String: Any]? = nil,
         queryItems: [String: Any]? = nil,
         body: [String: Any]? = nil,
         cachePolicy: NSURLRequest.CachePolicy = .reloadIgnoringLocalAndRemoteCacheData) {
        self.urlString = urlString
        self.method = method
        self.requireAccessToken = requireAccessToken

        var httpHeaders = [String: Any]()
        headers?.forEach { key, value in
            httpHeaders[key] = value
        }

        self.headers = httpHeaders
        self.queryItems = queryItems
        self.body = body
        self.cachePolicy = cachePolicy
    }
}
