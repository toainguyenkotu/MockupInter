//
//  LocationView.swift
//  MockupInterview
//
//  Created by Toai NDT on 23/11/24.
//

import SwiftUI

struct LocationView: View {
    let location: String

    init(location: String) {
        self.location = location
    }

    var body: some View {
        HStack(spacing: 0) {
            Asset.icLocation.swiftUIImage
                .resizable()
                .foregroundStyle(.gray)
                .frame(width: 15, height: 15)
                .padding(.trailing, 5)

            Text(location)
                .foregroundStyle(.gray)
                .font(.system(size: 14, weight: .regular))
        }
    }
}
