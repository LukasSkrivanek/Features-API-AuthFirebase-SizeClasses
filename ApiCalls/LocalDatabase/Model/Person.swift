//
//  Person.swift
//  ApiCalls
//
//  Created by macbook on 02.08.2024.
//

import SwiftData
import Foundation

@Model class Person {
    
    init(id: UUID, name: String, age: Int) {
        self.id = id
        self.name = name
        self.age = age
    }
    
    
    @Attribute(.unique) var id: UUID
    var name: String
    var age: Int
}
