//
//  TasksView.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 07/03/2026.
//

import SwiftUI

struct TasksView: View {
    
    @StateObject var viewModel = TasksViewModel()
    
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
