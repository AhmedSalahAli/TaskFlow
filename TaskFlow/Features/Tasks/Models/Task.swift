//
//  Task.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 07/03/2026.
//

import Foundation

struct Task: Identifiable, Decodable {
    
    let id: Int
    let title: String
    let completed: Bool
    
}
