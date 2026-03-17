//
//  DefaultTaskRepository.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 07/03/2026.
//

import Foundation

public final class DefaultTaskRepository: TaskRepository {

    private let remote: TaskRemoteDataSource
    private let local: TaskLocalDataSource

    public init(
        remote: TaskRemoteDataSource,
        local: TaskLocalDataSource
    ) {
        self.remote = remote
        self.local = local
    }
    
    public func fetchTasks() async throws -> [TaskModel] {

        // 1️⃣ read local first
        let localTasks = local.fetchTasks()

        // 2️⃣ refresh in background
        Task {

            do {

                let remoteTasks = try await remote.fetchTasks()

                local.saveTasks(remoteTasks)

            } catch {

                // ignore refresh errors

            }

        }

        // 3️⃣ return cached data immediately
        return localTasks
    }
}
