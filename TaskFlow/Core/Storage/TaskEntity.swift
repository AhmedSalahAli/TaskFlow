//
//  TaskEntity.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 07/03/2026.
//

import Foundation
import SwiftData

@Model
class TaskEntity {

    var id: Int
    var title: String
    var completed: Bool

    init(id: Int, title: String, completed: Bool) {
        self.id = id
        self.title = title
        self.completed = completed
    }

}
