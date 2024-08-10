//
//  MockData.swift
//  Tinder
//
//  Created by Almir Khialov on 02.08.2024.
//

import Foundation


struct MockData {
    static let users: [User] = [
        .init(
            id:NSUUID().uuidString,
            fullname: "Lora Dynamic",
            age: 27,
            profileImageURL: ["lora", "lora1"]
        ),
        .init(
            id:NSUUID().uuidString,
            fullname: "Mia Maldama",
            age: 28,
            profileImageURL: ["mia","mia1","mia2"]
        ),
        .init(
            id:NSUUID().uuidString,
            fullname: "Aleyna Tilki",
            age: 32,
            profileImageURL: ["aleyna", "aleyna1","aleyna2"]
        ),
        .init(
            id:NSUUID().uuidString,
            fullname: "Anna Locke",
            age: 23,
            profileImageURL: ["anna", "anna1","anna2","anna3"]
        ),
        .init(
            id:NSUUID().uuidString,
            fullname: "Mark Denoska",
            age: 27,
            profileImageURL: ["mark", "mark1","mark2","mark3"]
        ),
        .init(
            id:NSUUID().uuidString,
            fullname: "Yon Sinwon",
            age: 23,
            profileImageURL: ["yon", "yon1","yon2","mark3"]
        )
        
    ]
}
