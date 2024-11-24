//
//  UserDetailMock.swift
//  MockupInterviewTests
//
//  Created by Toai NDT on 23/11/24.
//

import Foundation
@testable import MockupInterview

struct UserDetailMock {
    
    func mock() -> UserDetail? {
        if let fileURL = Bundle.main.url(forResource: "UserDetailMock", withExtension: "json") {
            do {
                let fileData = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                return try decoder.decode(UserDetail.self, from: fileData)
            } catch {
                print("Error loading JSON: \(error.localizedDescription)")
                return nil
            }
        } else {
            print("File not found")
            return nil
        }
    }
}
