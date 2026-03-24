//
//  File.swift
//  TasksFeature
//
//  Created by Ahmed Salah on 11/03/2026.
//

import Foundation
import Networking

public final class TaskRemoteDataSource: Sendable {

    private let network: NetworkService

    public init(network: NetworkService) {
        self.network = network
    }

    public func fetchTasks(page: Int, limit: Int) async throws -> [TaskModel] {

        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!

        let dto: [TaskDTO] = try await network.request(url: url)

        // 🧠 simulate pagination
        let start = (page - 1) * limit
        let end = min(start + limit, dto.count)

        guard start < end else { return [] }

        let pageItems = Array(dto[start..<end])

        return pageItems.map { $0.toDomain() }
    }
}
