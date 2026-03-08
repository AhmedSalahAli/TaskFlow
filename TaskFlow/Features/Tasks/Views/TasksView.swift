//
//  TasksView.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 07/03/2026.
//

import SwiftUI
import SwiftData

struct TasksView: View {

    @Environment(\.modelContext) private var context
    @StateObject private var viewModel: TasksViewModel

    init(context: ModelContext) {

        let container = AppContainer(context: context)

        _viewModel = StateObject(
            wrappedValue: TasksViewModel(
                fetchTasksUseCase: container.fetchTasksUseCase
            )
        )

    }

    var body: some View {

        NavigationStack {

            List(viewModel.tasks) { task in
                Text(task.title)
            }

            .navigationTitle("TaskFlow")
            .task {
                await viewModel.loadTasks()
            }

        }

    }

}
