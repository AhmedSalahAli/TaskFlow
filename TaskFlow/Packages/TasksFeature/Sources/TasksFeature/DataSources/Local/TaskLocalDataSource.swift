//
//  TaskLocalDataSource.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 07/03/2026.
//

import SwiftData
import Foundation

public final class TaskLocalDataSource {

    private let context: ModelContext

    public init(context: ModelContext) {
        self.context = context
    }

    public func saveTasks(_ tasks: [Task]) {

        for task in tasks {

            let entity = TaskEntity(
                id: task.id,
                title: task.title,
                completed: task.completed
            )

            context.insert(entity)
        }

        try? context.save()
    }

    public func fetchTasks() -> [Task] {

        let descriptor = FetchDescriptor<TaskEntity>()

        guard let entities = try? context.fetch(descriptor) else {
            return []
        }

        return entities.map {
            Task(
                id: $0.id,
                title: $0.title,
                completed: $0.completed
            )
        }
    }
}
