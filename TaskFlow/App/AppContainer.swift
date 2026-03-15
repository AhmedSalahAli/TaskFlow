//
//  AppContainer.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 08/03/2026.
//

import TasksFeature
import Networking
import SwiftData

final class AppContainer {

    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    lazy var remoteDataSource = TaskRemoteDataSource(
        network: APIService()
    )

    lazy var localDataSource = TaskLocalDataSource(
        context: context
    )

    lazy var taskRepository: TaskRepository = {
        DefaultTaskRepository(
            remote: remoteDataSource,
            local: localDataSource
        )
    }()

    lazy var fetchTasksUseCase = FetchTasksUseCase(
        repository: taskRepository
    )
}

