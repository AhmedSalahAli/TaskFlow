//
//  FetchTasksUseCase.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 07/03/2026.
//

import Foundation

@MainActor
public struct FetchTasksUseCase {

    private let repository: TaskRepository

    public init(repository: TaskRepository) {
        self.repository = repository
    }

    public func execute(page: Int, limit: Int) async throws -> [TaskModel] {
        try await repository.fetchTasks(page: page, limit: limit)
    }
}
