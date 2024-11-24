//
//  ViewDidLoadModifier.swift
//  MockupInterview
//
//  Created by Toai NDT on 22/11/24.
//

import SwiftUI

struct ViewDidLoadModifier: ViewModifier {
    @State private var didLoad = false
    private let action: (() -> Void)?

    init(perform action: (() -> Void)? = nil) {
        self.action = action
    }

    func body(content: Content) -> some View {
        content
            .onAppear {
                if didLoad == false {
                    didLoad = true
                    action?()
                }
            }
            .opacity(didLoad ? 1 : 0)
    }
}

extension View {
    func onLoad(perform action: (() -> Void)? = nil) -> some View {
        modifier(ViewDidLoadModifier(perform: action))
    }
}
