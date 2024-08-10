//
//  MatchManager.swift
//  Tinder
//
//  Created by Almir Khialov on 10.08.2024.
//

import Foundation

@MainActor
class MatchManager: ObservableObject {
    @Published var matchedUser: User?
    
    func checkForMatch(withUser user: User){
        let didMatch = Bool.random()
        
        if didMatch {
            
        }
    }
}
