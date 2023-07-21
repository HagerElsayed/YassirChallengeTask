//
//  YassirChallengeTaskApp.swift
//  YassirChallengeTask
//
//  Created by Hager Elsayed on 20/07/2023.
//

import SwiftUI

@main
struct YassirChallengeTaskApp: App {
    @StateObject private var homeViewModel = HomeViewModel()
    var body: some Scene {
        WindowGroup {
//            MovieHomeView()
//                .environmentObject(homeViewModel)
            MainFlow()
        }
    }
}
