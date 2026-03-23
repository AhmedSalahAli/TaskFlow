//
//  FetchTasksUseCaseTests.swift
//  TaskFlowTests
//
//  Created by Ahmed Salah on 15/03/2026.
//

import XCTest
@testable import TasksFeature

@MainActor
final class FetchTasksUseCaseTests: XCTestCase {

    func testFetchTasksReturnsTasks() async throws {

        let mockRepository = MockTaskRepository()

        mockRepository.tasks = [
            TaskModel(id: 1, title: "Test Task", completed: false)
        ]

        let useCase = FetchTasksUseCase(repository: mockRepository)

        let tasks = try await useCase.execute(page: 1, limit: 10)

        XCTAssertEqual(tasks.count, 1)
        XCTAssertEqual(tasks.first?.title, "Test Task")
    }
}
