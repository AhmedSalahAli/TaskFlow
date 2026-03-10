//
//  AppContainer.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 08/03/2026.
//

import TasksFeature
import SwiftData

final class AppContainer {

    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    lazy var taskRepository: TaskRepository = {
        RemoteTaskRepository()
    }()

    lazy var fetchTasksUseCase = FetchTasksUseCase(
        repository: taskRepository
    )
}
