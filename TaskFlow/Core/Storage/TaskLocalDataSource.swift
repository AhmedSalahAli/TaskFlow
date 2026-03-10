//
//  TaskLocalDataSource.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 07/03/2026.
//

import SwiftData
import Foundation
import TasksFeature

final class TaskLocalDataSource {

    func saveTasks(
        _ tasks: [Task],
        context: ModelContext
    ) {

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

    func fetchTasks(
        context: ModelContext
    ) -> [Task] {

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
