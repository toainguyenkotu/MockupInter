//
//  FollowView.swift
//  MockupInterview
//
//  Created by Toai NDT on 23/11/24.
//

import SwiftUI

enum FollowType: String {
    case follower = "Follower"
    case following = "Following"
}

struct FollowView: View {
    let numberFollower: Int
    let numberFollowing: Int

    init(numberFollower: Int, numberFollowing: Int) {
        self.numberFollower = numberFollower
        self.numberFollowing = numberFollowing
    }

    var body: some View {
        HStack(spacing: 0) {
            followChidView(numberFollow: numberFollower, type: .follower)
            Spacer().frame(width: 100)
            followChidView(numberFollow: numberFollowing, type: .following)
        }
    }
}

private extension FollowView {
    private func followChidView(numberFollow: Int, type: FollowType) -> some View {
        VStack(spacing: 0) {
            Circle()
                .frame(width: 50, height: 50)
                .foregroundStyle(.gray.opacity(0.3))
                .overlay {
                    (type == .follower ? Asset.icFollower.swiftUIImage : Asset.icFollowing.swiftUIImage)
                        .resizable()
                        .frame(width: 25, height: 25)
                }

            Text(numberFollow == 0 ? "\(0)" : "\(numberFollow)+")
                .foregroundStyle(.gray)
                .bold()
                .padding(.top, 7)
                .padding(.bottom, 3)

            Text(type.rawValue)
                .foregroundStyle(.gray)
        }
    }
}
