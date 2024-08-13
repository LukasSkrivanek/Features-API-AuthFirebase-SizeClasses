//
//  User.swift
//  ApiCalls
//
//  Created by macbook on 06.08.2024.
//

import Foundation

struct UserFirebase: Identifiable, Codable {
    let id: String
    let fullName: String
    let email: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}

extension UserFirebase {
    static var MOCK_USER = UserFirebase(id: NSUUID().uuidString, fullName: "Kobe Bryant", email: "test@gmail.com")
}

