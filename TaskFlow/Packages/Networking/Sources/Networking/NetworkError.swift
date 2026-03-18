//
//  NetworkError.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 07/03/2026.
//

import Foundation

public enum NetworkError: Error {
    
    case invalidURL
    case invalidResponse
    case decodingError
    case serverError
    
}
