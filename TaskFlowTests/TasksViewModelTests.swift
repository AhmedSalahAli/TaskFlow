//
//  TasksViewModelTests.swift
//  TaskFlowTests
//
//  Created by Ahmed Salah on 16/03/2026.
//

import XCTest
@testable import TasksFeature

@MainActor
final class TasksViewModelTests: XCTestCase {

    func testLoadTasksSuccess() async {

        let mockRepository = MockTaskRepository()

        let tasks = [
            TaskModel(id: 1, title: "Test Task", completed: false)
        ]

        mockRepository.tasks = tasks

        let useCase = FetchTasksUseCase(repository: mockRepository)

        let viewModel = TasksViewModel(fetchTasksUseCase: useCase)

        await viewModel.loadTasks()

        XCTAssertEqual(viewModel.state, .loaded(tasks))
    }
    
    func testLoadTasksEmpty() async {

        let mockRepository = MockTaskRepository()

        mockRepository.tasks = []

        let useCase = FetchTasksUseCase(repository: mockRepository)

        let viewModel = TasksViewModel(fetchTasksUseCase: useCase)

        await viewModel.loadTasks()

        XCTAssertEqual(viewModel.state, .empty)
    }
    
    func testLoadTasksError() async {

        let mockRepository = MockTaskRepository()

        mockRepository.shouldThrowError = true

        let useCase = FetchTasksUseCase(repository: mockRepository)

        let viewModel = TasksViewModel(fetchTasksUseCase: useCase)

        await viewModel.loadTasks()

        if case .error = viewModel.state {
            XCTAssertTrue(true)
        } else {
            XCTFail("Expected error state")
        }
    }

}
