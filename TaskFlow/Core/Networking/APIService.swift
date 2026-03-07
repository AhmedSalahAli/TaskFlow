//
//  APIService.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 07/03/2026.
//

import Foundation

final class APIService {
    
    private let client = NetworkClient.shared
    
    func fetchTasks() async throws -> [Task] {
        
        guard let url = URL(
            string: "https://jsonplaceholder.typicode.com/todos"
        ) else {
            throw NetworkError.invalidURL
        }
        
        return try await client.request(url: url)
        
    }
}


