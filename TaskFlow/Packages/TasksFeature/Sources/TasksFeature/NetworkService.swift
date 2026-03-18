//
//  File.swift
//  Networking
//
//  Created by Ahmed Salah on 11/03/2026.
//

import Foundation

public protocol NetworkService: Sendable {

    func request<T: Decodable & Sendable>(
        url: URL
    ) async throws -> T
}
