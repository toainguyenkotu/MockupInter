//
//  BaseEndpoint.swift
//  MockupInterview
//
//  Created by Toai NDT on 19/11/24.
//

import Foundation

public protocol URLRequestConvertible {
    var urlRequest: URLRequest? { get }
}

public struct HTTPMethod: RawRepresentable, Equatable, Hashable {
    /// `CONNECT` method.
    public static let connect = HTTPMethod(rawValue: "CONNECT")
    /// `DELETE` method.
    public static let delete = HTTPMethod(rawValue: "DELETE")
    /// `GET` method.
    public static let get = HTTPMethod(rawValue: "GET")
    /// `HEAD` method.
    public static let head = HTTPMethod(rawValue: "HEAD")
    /// `OPTIONS` method.
    public static let options = HTTPMethod(rawValue: "OPTIONS")
    /// `PATCH` method.
    public static let patch = HTTPMethod(rawValue: "PATCH")
    /// `POST` method.
    public static let post = HTTPMethod(rawValue: "POST")
    /// `PUT` method.
    public static let put = HTTPMethod(rawValue: "PUT")
    /// `QUERY` method.
    public static let query = HTTPMethod(rawValue: "QUERY")
    /// `TRACE` method.
    public static let trace = HTTPMethod(rawValue: "TRACE")

    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

public protocol BaseEndpoint: URLRequestConvertible {
    var urlString: String { get }
    var method: HTTPMethod { get }
    var requireAccessToken: Bool { get }
    var headers: [String: Any]? { get set }
    var body: [String: Any]? { get }
    var queryItems: [String: Any]? { get }
    var cachePolicy: NSURLRequest.CachePolicy { get }
    var urlRequest: URLRequest? { get }
}

public extension BaseEndpoint {
    var headers: [String: Any]? { nil }
    var queryItems: [String: Any]? { nil }
}

public extension BaseEndpoint {
    private var urlComponents: URLComponents? {
        let components = URLComponents(string: urlString)
        guard var components else { return nil }

        if let queryItems {
            components.queryItems = queryItems.compactMap { name, value in
                URLQueryItem(name: name, value: "\(value)")
            }
        }

        return components
    }

    var urlRequest: URLRequest? {
        guard let url = urlComponents?.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.cachePolicy = cachePolicy

        headers?.forEach { key, value in
            if let value = value as? String {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }

        if let body {
            let jsonData = try? JSONSerialization.data(withJSONObject: body)
            request.httpBody = jsonData
        }

        return request
    }
}
