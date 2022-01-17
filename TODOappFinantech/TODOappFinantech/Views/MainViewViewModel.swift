//
//  MainViewViewModel.swift
//  TODOappFinantech
//
//  Created by Mikołaj Linczewski on 15/01/2022.
//

import Foundation

class MainViewViewModel {
    static let toDos: [ToDo] = [
        ToDo(ID: UUID(), name: "zesrac sie", description: "kupa kupa kupa", category: .personal, priority: .high),
        ToDo(ID: UUID(), name: "zrobic lekcje", description: "strona 3 zad 1, 2, 3", category: .school, priority: .low),
        ToDo(ID: UUID(), name: "task 12221", description: "bug when opening mainview", category: .work, priority: .high),
        ToDo(ID: UUID(), name: "RANDKA Z AMA", description: "quattro piatti", category: .personal, priority: .high)
    ]
}
