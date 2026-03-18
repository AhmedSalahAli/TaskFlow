//
//  File.swift
//  TasksFeature
//
//  Created by Ahmed Salah on 12/03/2026.
//

import Foundation

public struct TaskDTO: Decodable, Sendable {

    public let id: Int
    public let title: String
    public let completed: Bool

}
