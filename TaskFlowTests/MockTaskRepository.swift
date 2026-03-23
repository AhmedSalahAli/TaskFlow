//
//  MockTaskRepository.swift
//  TaskFlowTests
//
//  Created by Ahmed Salah on 15/03/2026.
//

import Foundation
@testable import TasksFeature

final class MockTaskRepository: TaskRepository {

    var tasks: [TaskModel] = []
    var shouldThrowError = false

    func fetchTasks(page: Int, limit: Int) async throws -> [TaskModel] {

        if shouldThrowError {
            throw NSError(domain: "TestError", code: 1)
        }

        return tasks
    }
}
