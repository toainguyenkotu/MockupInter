//
//  MockupInterviewApp.swift
//  MockupInterview
//
//  Created by Toai NDT on 19/11/24.
//

import SwiftUI

@main
struct MockupInterviewApp: App {
    @State private var isShowSplashViewCompleted = false

    var body: some Scene {
        WindowGroup {
            if !isShowSplashViewCompleted {
                SplashView(isCompleteAnimation: $isShowSplashViewCompleted)
            }
            if isShowSplashViewCompleted {
                CoordinatorStack(UserCoordinatorPages.root)
            }
        }
    }
}
