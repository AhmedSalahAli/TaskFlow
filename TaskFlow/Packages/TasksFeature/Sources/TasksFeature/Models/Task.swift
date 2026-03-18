//
//  TaskModel.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 07/03/2026.
//

import Foundation

public struct TaskModel: Identifiable, Decodable, Sendable, Equatable {

    public let id: Int
    public let title: String
    public let completed: Bool

    public init(
        id: Int,
        title: String,
        completed: Bool
    ) {
        self.id = id
        self.title = title
        self.completed = completed
    }
}
