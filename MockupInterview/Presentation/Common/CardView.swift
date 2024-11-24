//
//  CardView.swift
//  MockupInterview
//
//  Created by Toai NDT on 23/11/24.
//

import SDWebImageSwiftUI
import SwiftUI

struct CardView<Content: View>: View {
    let loginName: String
    let urlAvatarString: String
    let otherInformationView: () -> Content

    init(loginName: String,
         urlAvatarString: String,
         otherInformationView: @escaping () -> Content) {
        self.loginName = loginName
        self.urlAvatarString = urlAvatarString
        self.otherInformationView = otherInformationView
    }

    var body: some View {
        HStack(spacing: 0) {
            WebImage(url: URL(string: urlAvatarString)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .padding(10)
            } placeholder: {
                Rectangle().aspectRatio(1, contentMode: .fit).foregroundColor(.gray)
            }
            .background(Color.gray.opacity(0.4).cornerRadius(10))

            VStack(alignment: .leading, spacing: 0) {
                Text(loginName)
                Divider()
                    .padding(.horizontal, 5)
                    .padding(.vertical, 15)
                otherInformationView()
                Spacer()
            }
            .padding(.leading, 15)
        }
        .frame(maxWidth: .infinity)
        .padding(.all, 15)
        .background(
            Color.white
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0.0, y: 1)
        )
    }
}
