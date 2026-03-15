//
//  ViewModels.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 07/03/2026.
//

import Foundation
import Combine

@MainActor
public final class TasksViewModel: ObservableObject {

    @Published public private(set) var state: TasksState = .idle

    private let fetchTasksUseCase: FetchTasksUseCase

    public init(fetchTasksUseCase: FetchTasksUseCase) {
        self.fetchTasksUseCase = fetchTasksUseCase
    }

    public func loadTasks() {

        state = .loading

        Task {

            do {

                let tasks = try await fetchTasksUseCase.execute()

                if tasks.isEmpty {
                    state = .empty
                } else {
                    state = .loaded(tasks)
                }

            } catch {

                state = .error(error.localizedDescription)

            }

        }
    }
}
