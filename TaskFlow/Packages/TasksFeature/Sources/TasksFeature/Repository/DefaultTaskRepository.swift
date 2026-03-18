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

    private var refreshTask: Task<Void, Never>?

    public init(
        remote: TaskRemoteDataSource,
        local: TaskLocalDataSource
    ) {
        self.remote = remote
        self.local = local
    }

    public func fetchTasks(page: Int, limit: Int) async throws -> [TaskModel] {

        // 🧠 Only cache first page
        if page == 1 {

            let localTasks = local.fetchTasks()

            // 🧠 First launch → fetch remote blocking
            if localTasks.isEmpty {

                let remoteTasks = try await remote.fetchTasks(page: 1, limit: limit)
                local.saveTasks(remoteTasks)

                return remoteTasks
            }

            // 🧠 Return cache immediately
            refreshFirstPageInBackground(limit: limit)

            return localTasks
        }

        // 🧠 Pagination → always remote (no cache)
        return try await remote.fetchTasks(page: page, limit: limit)
    }

    // MARK: - Private

    private func refreshFirstPageInBackground(limit: Int) {

        refreshTask?.cancel()

        refreshTask = Task {

            do {

                let remoteTasks = try await remote.fetchTasks(page: 1, limit: limit)

                guard !Task.isCancelled else { return }

                local.saveTasks(remoteTasks)

            } catch {
                // ignore (production: log)
            }
        }
    }
}
