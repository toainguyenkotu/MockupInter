//
//  LoadingView.swift
//  MockupInterview
//
//  Created by Toai NDT on 22/11/24.
//

import SwiftUI

extension View {
    @ViewBuilder
    func loadingView(isShow: Bool) -> some View {
        ZStack {
            self

            if isShow {
                Rectangle()
                    .fill(.black.opacity(0.4))
                    .opacity(0.1)
                    .ignoresSafeArea()
                    .overlay {
                        ProgressView()
                            .id(UUID())
                            .tint(.black)
                            .controlSize(.large)
                    }
            }
        }
    }
}
