//
//  ViewModels.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 07/03/2026.
//

import Foundation
import Combine

@MainActor
public class TasksViewModel: ObservableObject {

    @Published var tasks: [Task] = []

    private let fetchTasksUseCase: FetchTasksUseCase

    public init(fetchTasksUseCase: FetchTasksUseCase) {
        self.fetchTasksUseCase = fetchTasksUseCase
    }

    func loadTasks() async {

        do {
            tasks = try await fetchTasksUseCase.execute()
        } catch {
            print(error)
        }

    }

}
