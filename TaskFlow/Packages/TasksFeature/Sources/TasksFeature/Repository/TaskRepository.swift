//
//  TaskRepository.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 07/03/2026.
//

import Foundation

public protocol TaskRepository: Sendable {
    
    func fetchTasks() async throws -> [Task]
    
}
