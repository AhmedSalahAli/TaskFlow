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

    private var container: AppContainer {
        AppContainer(context: context)
    }

    var body: some View {
        
        TasksView(
            viewModel: container.tasksViewModel
        )

    }
}
