//
//  CardService.swift
//  Tinder
//
//  Created by Almir Khialov on 02.08.2024.
//

import Foundation


struct CardService {
    func fetchCardModels() async throws -> [CardModel] {
        let users = MockData.users
        return users.map({ CardModel(user: $0)})
        
        
    }
}
