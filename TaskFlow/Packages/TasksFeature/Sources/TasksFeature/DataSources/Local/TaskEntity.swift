//
//  TaskEntity.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 07/03/2026.
//

import Foundation
import SwiftData

@Model
public class TaskEntity {

    public var id: Int
    public var title: String
    public var completed: Bool

    public init(id: Int, title: String, completed: Bool) {
        self.id = id
        self.title = title
        self.completed = completed
    }

}
