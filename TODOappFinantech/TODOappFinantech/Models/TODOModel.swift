//
//  TODOModel.swift
//  TODOappFinantech
//
//  Created by Mikołaj Linczewski on 15/01/2022.
//

import Foundation

struct Category: Equatable {
    static let work = Category(name: "work", icon: "👷‍♀️")
    static let school = Category(name: "school", icon: "👩‍🏫")
    static let houseKeeping = Category(name: "houseKeeping", icon: "🏠")
    static let personal = Category(name: "work", icon: "❤️")
    
    let name: String
    let icon: String
}

enum Priority: String {
    case high = "high"
    case low = "low"
}

struct ToDo {
    let ID: UUID
    let name: String
    let description: String
    let category: Category
    let priority: Priority
}
