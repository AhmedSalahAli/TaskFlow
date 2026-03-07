//
//  ViewModels.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 07/03/2026.
//

import Foundation
import Combine
import SwiftData


@MainActor
class TasksViewModel: ObservableObject {

    @Published var tasks: [Task] = []

    func loadTasks(context: ModelContext) async {

        let repository = RemoteTaskRepository(context: context)
        let useCase = FetchTasksUseCase(repository: repository)

        do {
            tasks = try await useCase.execute()
        } catch {
            print(error)
        }

    }

}
