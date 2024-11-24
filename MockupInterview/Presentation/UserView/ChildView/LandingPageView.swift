//
//  LandingPageView.swift
//  MockupInterview
//
//  Created by Toai NDT on 23/11/24.
//

import SwiftUI

struct LandingPageView: View {
    let landingPageUrl: String
    let onTapUrl: (() -> Void)?

    init(landingPageUrl: String, onTapUrl: (() -> Void)?) {
        self.landingPageUrl = landingPageUrl
        self.onTapUrl = onTapUrl
    }

    var body: some View {
        Text(landingPageUrl)
            .underline()
            .foregroundStyle(.blue)
            .onTapGesture {
                onTapUrl?()
            }
            .frame(maxHeight: .infinity, alignment: .topLeading)
    }
}
