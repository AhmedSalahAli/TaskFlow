//
//  ContentView.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 08/03/2026.
//

import SwiftUI
import SwiftData
import TasksFeature

struct ContentView: View {

    @Environment(\.modelContext) private var context

    var body: some View {

        let container = AppContainer(context: context)

        TasksView(
            viewModel: TasksViewModel(
                fetchTasksUseCase: container.fetchTasksUseCase
            )
        )
    }
}
