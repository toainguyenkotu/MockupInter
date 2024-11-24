//
//  NavigationBarCustom.swift
//  MockupInterview
//
//  Created by Toai NDT on 22/11/24.
//

import SwiftUI

extension View {
    @ViewBuilder func backButton(action: (() -> Void)?) -> some View {
        navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        action?()
                    } label: {
                        Asset.iconLeftArow.swiftUIImage
                            .resizable()
                            .frame(width: 30, height: 20)
                    }
                }
            }
    }
}
