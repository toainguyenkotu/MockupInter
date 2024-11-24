//
//  PreferenceKey.swift
//  MockupInterview
//
//  Created by Toai NDT on 20/11/24.
//

import SwiftUI

struct OffsetBottomPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
