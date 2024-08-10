//
//  CardModel.swift
//  Tinder
//
//  Created by Almir Khialov on 02.08.2024.
//

import Foundation

struct CardModel {
    let user: User
}

extension CardModel: Identifiable, Hashable {
    var id: String {return user.id }
}
