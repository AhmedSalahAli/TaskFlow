//
//  TaskRepository.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 07/03/2026.
//

import Foundation

@MainActor
public protocol TaskRepository {
    func fetchTasks(page: Int, limit: Int) async throws -> [TaskModel]
}
