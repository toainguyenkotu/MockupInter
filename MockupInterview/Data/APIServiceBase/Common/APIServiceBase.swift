//
//  APIServiceBase.swift
//  MockupInterview
//
//  Created by Toai NDT on 19/11/24.
//

import Combine
import Foundation

public struct APIInput<T, Decoder> where T: Decodable, Decoder: TopLevelDecoder, Decoder.Input == Data {
    public var endpoint: BaseEndpoint
    let decodingType: T.Type
    let decoder: Decoder

    public init(endpoint: BaseEndpoint,
                decodingType: T.Type,
                decoder: Decoder = JSONDecoder()) {
        self.endpoint = endpoint
        self.decodingType = decodingType
        self.decoder = decoder
    }
}

open class APIServiceBase {
    var session: URLSession

    public init(session: URLSession) {
        self.session = session
    }

    @discardableResult
    open func request<T, Decoder>(_ input: APIInput<T, Decoder>) async throws -> T {
        let input = preprocess(input)
        guard let urlRequest = input.endpoint.urlRequest else {
            print("❌ [Invalid Request]\(input.endpoint.urlRequest?.url?.absoluteString ?? "")")
            throw APIErrorBase.invalidRequest
        }
        print("🌎 \(input.endpoint.method.rawValue) \(urlRequest.url?.absoluteString ?? "")")
        do {
            let (data, response) = try await session.data(for: urlRequest)
            guard let httpResponse = response as? HTTPURLResponse else {
                print("❌ [Invalid Response]\(response.url?.absoluteString ?? "")")
                throw APIErrorBase.responseUnsuccessful
            }
            guard (200 ..< 300).contains(httpResponse.statusCode) else {
                print("❌ [\(httpResponse.statusCode)] " + (response.url?.absoluteString ?? ""))
                throw try mapResponseError(httpResponse: httpResponse, data: data, input: input)
            }
            print("👍 [\(httpResponse.statusCode)] " + (response.url?.absoluteString ?? ""))

            let decodedData = try input.decoder.decode(T.self, from: data)
            return decodedData
        } catch {
            return try await handleResponseError(error: error, input: input)
        }
    }

    open func preprocess<T, Decoder>(_ input: APIInput<T, Decoder>) -> APIInput<T, Decoder> {
        input
    }

    open func mapResponseError<T, Decoder>(
        httpResponse: HTTPURLResponse,
        data: Data,
        input: APIInput<T, Decoder>
    ) throws -> Error {
        APIErrorBase.responseUnsuccessful
    }

    open func handleResponseError<T, Decoder>(error: Error, input: APIInput<T, Decoder>) async throws -> T {
        throw error
    }
}
