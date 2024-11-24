//
//  APIService.swift
//  MockupInterview
//
//  Created by Toai NDT on 19/11/24.
//

import Foundation

final class APIService: APIServiceBase {
    init() {
        super.init(session: URLSession(configuration: .default))
    }

    override func preprocess<T, Decoder>(_ input: APIInput<T, Decoder>) -> APIInput<T, Decoder> {
        var newInput = input
        var header = input.endpoint.headers ?? [:]
        header["Content-Type"] = "application/json; charset=utf-8"
        header["Accept"] = "application/json"

        // if your api is private api you can config basic authen right here
        newInput.endpoint.headers = header
        return super.preprocess(newInput)
    }

    override func mapResponseError<T, Decoder>(
        httpResponse: HTTPURLResponse,
        data: Data,
        input: APIInput<T, Decoder>
    ) throws -> Error {
        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        if let message = json?["message"] as? String {
            return IDError(message: message)
        }
        throw try super.mapResponseError(httpResponse: httpResponse, data: data, input: input)
    }
}
