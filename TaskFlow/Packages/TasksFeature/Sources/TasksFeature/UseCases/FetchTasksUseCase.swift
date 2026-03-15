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

    public func execute() async throws -> [Task] {
        try await repository.fetchTasks()
    }
}
