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

    private var refreshTask: Task<Void, Never>?   // ✅ control background task

    public init(
        remote: TaskRemoteDataSource,
        local: TaskLocalDataSource
    ) {
        self.remote = remote
        self.local = local
    }

    public func fetchTasks() async throws -> [TaskModel] {

        let localTasks = local.fetchTasks()

        // 🧠 Case 1: First load (no cache)
        if localTasks.isEmpty {

            let remoteTasks = try await remote.fetchTasks()
            local.saveTasks(remoteTasks)

            return local.fetchTasks()
        }

        // 🧠 Case 2: Cached data exists → return immediately
        refreshInBackground()

        return localTasks
    }

    // MARK: - Private

    private func refreshInBackground() {

        // ❗️cancel previous task to avoid duplication
        refreshTask?.cancel()

        refreshTask = Task {

            do {

                let remoteTasks = try await remote.fetchTasks()

                // ❗️check cancellation
                guard !Task.isCancelled else { return }

                local.saveTasks(remoteTasks)

            } catch {
                // ignore silently (production apps log this)
            }
        }
    }
}
