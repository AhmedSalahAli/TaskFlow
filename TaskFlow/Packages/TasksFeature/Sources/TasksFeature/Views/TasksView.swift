//
//  TasksView.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 07/03/2026.
//

import SwiftUI
import SwiftData


public struct TasksView: View {

    @StateObject private var viewModel: TasksViewModel

    public init(viewModel: TasksViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {

        NavigationStack {

            List(viewModel.tasks) { task in
                Text(task.title)
            }

            .navigationTitle("TaskFlow")

        }
        .task {
            await viewModel.loadTasks()
        }
    }
}
