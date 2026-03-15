//
//  RemoteTaskRepository.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 07/03/2026.
//

import Foundation

public final class RemoteTaskRepository: TaskRepository {

    private let remote: TaskRemoteDataSource
    private let local: TaskLocalDataSource

    public init(
        remote: TaskRemoteDataSource,
        local: TaskLocalDataSource
    ) {
        self.remote = remote
        self.local = local
    }

    public func fetchTasks() async throws -> [Task] {

        do {

            let tasks = try await remote.fetchTasks()

            local.saveTasks(tasks)

            return tasks

        } catch {

            return local.fetchTasks()
        }
    }
}
