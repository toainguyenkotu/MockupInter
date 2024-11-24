//
//  SplashView.swift
//  MockupInterview
//
//  Created by Toai NDT on 24/11/24.
//

import SwiftUI

struct SplashView: View {
    @State private var animate = false
    @Binding var isCompleteAnimation: Bool

    var body: some View {
        VStack {
            Asset.iconGithub.swiftUIImage
                .resizable()
                .frame(width: animate ? 200 : 100, height: animate ? 200 : 100)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray)
        .ignoresSafeArea()
        .onAppear {
            withAnimation(.bouncy(extraBounce: 0.2)) {
                animate = true
            }
            Task {
                try await Task.sleep(nanoseconds: 2_000_000_000)
                isCompleteAnimation.toggle()
            }
        }
    }
}
