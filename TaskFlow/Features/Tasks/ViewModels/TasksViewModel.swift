//
//  ViewModels.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 07/03/2026.
//

import Foundation
import Combine

@MainActor
class TasksViewModel: ObservableObject {
    
    @Published var tasks: [Task] = []
    
    private let fetchTasksUseCase: FetchTasksUseCase
    
    init() {
        let repository = RemoteTaskRepository()
        self.fetchTasksUseCase = FetchTasksUseCase(repository: repository)
    }
    
    func loadTasks() async {
        do {
            tasks = try await fetchTasksUseCase.execute()
        } catch {
            print(error)
        }
    }
    
}
