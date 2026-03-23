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
            
            content
                .navigationTitle("TaskFlow")
            
        }
        .task {
            await viewModel.loadTasks()
        }
    }
    
    @ViewBuilder
    private var content: some View {
        
        switch viewModel.state {
            
        case .idle:
            EmptyView()
            
        case .loading:
            ProgressView()
            
        case .loaded(let tasks):

            List(tasks) { task in

                Text(task.title)
                    .onAppear {
                        Task {
                            await viewModel.loadMoreIfNeeded(currentItem: task)
                        }
                    }
            }
            .refreshable {
                await viewModel.refresh()
            }
            
        case .empty:
            
            VStack(spacing: 12) {
                Image(systemName: "tray")
                    .font(.largeTitle)
                
                Text("No Tasks")
            }
            
        case .error(let message):
            
            VStack(spacing: 12) {
                
                Image(systemName: "exclamationmark.triangle")
                
                Text(message)
                    .multilineTextAlignment(.center)
                
            }
        }
    }
}

//test git ci
