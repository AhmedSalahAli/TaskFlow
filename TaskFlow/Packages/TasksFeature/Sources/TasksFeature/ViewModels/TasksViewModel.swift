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
    
    private let useCase: FetchTasksUseCase
    
    private var page = 1
    private let limit = 20
    private var isLoading = false
    private var tasks: [TaskModel] = []
    
    public init(fetchTasksUseCase: FetchTasksUseCase) {
        self.useCase = fetchTasksUseCase
    }
    
    // Initial Load
    
    public func loadTasks() async {
        
        guard !isLoading else { return }
        isLoading = true
        
        updateState(.loading)
        
        do {
            
            let newTasks = try await useCase.execute(page: page, limit: limit)
            
            tasks = newTasks
            
            if tasks.isEmpty {
                updateState(.empty)
            } else {
                updateState(.loaded(tasks))
            }
            
        } catch {
            
            updateState(.error(error.localizedDescription))
        }
        
        isLoading = false
    }
    
    // Pagination
    public func loadMoreIfNeeded(currentItem: TaskModel) async {
        
        guard case .loaded(let currentTasks) = state else { return }
        
        guard currentItem.id == currentTasks.last?.id else { return }
        
        guard !isLoading else { return }
        
        isLoading = true
        page += 1
        
        do {
            
            let newTasks = try await useCase.execute(page: page, limit: limit)
            
            tasks.append(contentsOf: newTasks)
            
            updateState(.loaded(tasks))
            
        } catch {
            
            updateState(.error(error.localizedDescription))
        }
        
        isLoading = false
    }
    
    // Refresh
    public func refresh() async {
        
        page = 1
        
        await loadTasks()
    }
    
    private func updateState(_ newState: TasksState) {
        state = newState
    }
}
