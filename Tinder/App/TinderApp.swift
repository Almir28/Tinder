//
//  TinderApp.swift
//  Tinder
//
//  Created by Almir Khialov on 22.07.2024.
//

import SwiftUI

@main
struct TinderApp: App {
    @StateObject var matchManager = MatchManager()
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(matchManager)
        }
    }
}


