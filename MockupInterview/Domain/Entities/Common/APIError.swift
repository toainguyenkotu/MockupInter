//
//  IDError.swift
//  MockupInterview
//
//  Created by Toai NDT on 20/11/24.
//

import Foundation

enum StatusCode {
    static let notFound = 404
}

open class IDError: LocalizedError, Identifiable, Equatable {
    public let id = UUID().uuidString
    let message: String

    public init(message: String) {
        self.message = message
    }

    public var errorDescription: String? {
        message
    }

    public static func == (lhs: IDError, rhs: IDError) -> Bool {
        lhs.id == rhs.id
    }
}
