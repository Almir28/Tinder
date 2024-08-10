//
//  Users.swift
//  Tinder
//
//  Created by Almir Khialov on 02.08.2024.
//

import Foundation


struct User: Identifiable, Hashable {
    let id: String
    let fullname: String
    var age: Int
    var profileImageURL: [String]
}
