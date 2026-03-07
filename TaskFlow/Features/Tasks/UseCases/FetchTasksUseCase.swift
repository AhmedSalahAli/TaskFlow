//
//  FetchTasksUseCase.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 07/03/2026.
//

import Foundation

struct FetchTasksUseCase {
    
    private let repository: TaskRepository
    
    init(repository: TaskRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> [Task] {
        return try await repository.fetchTasks()
    }
    
}
