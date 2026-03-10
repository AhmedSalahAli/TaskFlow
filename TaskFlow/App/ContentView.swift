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

    let container = AppContainer()

    var body: some View {

        TasksView(
            viewModel: TasksViewModel(
                fetchTasksUseCase: container.fetchTasksUseCase
            )
        )
    }
}
