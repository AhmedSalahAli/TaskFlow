//
//  RemoteTaskRepository.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 07/03/2026.
//

import Foundation

final class RemoteTaskRepository: TaskRepository {
    
    private let apiService = APIService()
    
    func fetchTasks() async throws -> [Task] {
        return try await apiService.fetchTasks()
    }
    
}
