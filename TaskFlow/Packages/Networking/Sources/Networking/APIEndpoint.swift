//
//  APIEndpoint.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 07/03/2026.
//

import Foundation

public protocol APIEndpoint {
    
    var path: String { get }
    var method: String { get }
    
}
