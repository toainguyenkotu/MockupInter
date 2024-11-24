//
//  APIErrorBase.swift
//  MockupInterview
//
//  Created by Toai NDT on 19/11/24.
//  swiftlint:disable switch_case_on_newline

import Foundation

public enum APIErrorBase: LocalizedError {
    case invalidRequest
    case requestFailed
    case jsonConversionFailure
    case invalidData
    case responseUnsuccessful
    case jsonParsingFailure

    public var errorDescription: String {
        switch self {
        case .invalidRequest: return "Invalid Request"
        case .requestFailed: return "Request Failed"
        case .invalidData: return "Invalid Data"
        case .responseUnsuccessful: return "Response Unsuccessful"
        case .jsonParsingFailure: return "JSON Parsing Failure"
        case .jsonConversionFailure: return "JSON Conversion Failure"
        }
    }
}
