//
//  RemoteTaskRepository.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 07/03/2026.
//

import Foundation
import SwiftData

final class RemoteTaskRepository: TaskRepository {

    private let apiService = APIService()
    private let localDataSource = TaskLocalDataSource()
    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func fetchTasks() async throws -> [Task] {

        do {

            // 1️⃣ Fetch from API
            let tasks = try await apiService.fetchTasks()

            // 2️⃣ Save locally
            localDataSource.saveTasks(tasks, context: context)

            // 3️⃣ Return data
            return tasks

        } catch {

            // 4️⃣ If API fails → use local cache
            return localDataSource.fetchTasks(context: context)

        }

    }

}
