//
//  RemoteTaskRepository.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 07/03/2026.
//

import Foundation

public final class RemoteTaskRepository: TaskRepository {

    private let remote: TaskRemoteDataSource

    public init(remote: TaskRemoteDataSource) {
        self.remote = remote
    }

    public func fetchTasks() async throws -> [Task] {
        try await remote.fetchTasks()
    }
}
