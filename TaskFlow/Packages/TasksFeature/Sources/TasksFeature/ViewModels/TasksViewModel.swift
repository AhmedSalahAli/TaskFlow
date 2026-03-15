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

    public func loadTasks() async {

        updateState(.loading)

        do {

            let tasks = try await fetchTasksUseCase.execute()

            if tasks.isEmpty {
                updateState(.empty)
            } else {
                updateState(.loaded(tasks))
            }

        } catch {

            updateState(.error(error.localizedDescription))

        }
    }

    private func updateState(_ newState: TasksState) {
        state = newState
    }
}
