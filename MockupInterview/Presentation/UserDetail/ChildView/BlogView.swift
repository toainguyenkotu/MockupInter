//
//  BlogView.swift
//  MockupInterview
//
//  Created by Toai NDT on 23/11/24.
//

import SwiftUI

struct BlogView: View {
    let blogUrl: String

    init(blogUrl: String) {
        self.blogUrl = blogUrl
    }

    var body: some View {
        Text(L10n.blog)
            .font(.system(size: 25, weight: .bold))
            .frame(maxWidth: .infinity, alignment: .leading)

        Text(blogUrl)
            .foregroundStyle(.gray)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 10)
    }
}
