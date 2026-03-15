//
//  File.swift
//  TasksFeature
//
//  Created by Ahmed Salah on 11/03/2026.
//

import Foundation

public final class TaskRemoteDataSource: Sendable {

    private let network: NetworkService

    public init(network: NetworkService) {
        self.network = network
    }

    public func fetchTasks() async throws -> [TaskModel] {

        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!

        let dto: [TaskDTO] = try await network.request(url: url)

        return dto.map { $0.toDomain() }
    }

}
