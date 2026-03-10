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

    let apiService = APIService()

    lazy var taskRepository: TaskRepository = {
        RemoteTaskRepository(network: apiService)
    }()

    lazy var fetchTasksUseCase = FetchTasksUseCase(
        repository: taskRepository
    )
}
