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

    public func fetchTasks() async throws -> [Task] {

        do {

            // 1 fetch remote
            let remoteTasks = try await remote.fetchTasks()

            // 2 save local
            local.saveTasks(remoteTasks)

        } catch {

            // ignore remote failure
        }

        // 3 read local
        return local.fetchTasks()
    }
}
