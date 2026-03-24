//
//  APIService.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 07/03/2026.
//

import Foundation
//import TasksFeature

public final class APIService: NetworkService {

    private let client = NetworkClient.shared

    public init() {}

    public func request<T: Decodable & Sendable>(
        url: URL
    ) async throws -> T {

        try await client.request(url: url)

    }
}
