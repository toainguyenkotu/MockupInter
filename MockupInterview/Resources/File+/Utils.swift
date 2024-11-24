//
//  Utils.swift
//  MockupInterview
//
//  Created by Toai NDT on 20/11/24.
//

import UIKit

enum Utils {
    static func canOpenUrl(_ url: String) -> Bool {
        if let url = URL(string: url) {
            return UIApplication.shared.canOpenURL(url)
        }
        return false
    }
}
