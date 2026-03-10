//
//  NetworkClient.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 07/03/2026.
//

import Foundation

public actor NetworkClient {

    public static let shared = NetworkClient()

    public init() {}

    public func request<T: Decodable & Sendable>(url: URL) async throws -> T {

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let http = response as? HTTPURLResponse,
              http.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }

        return try JSONDecoder().decode(T.self, from: data)
    }
}
