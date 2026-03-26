//
//  File.swift
//  TasksFeature
//
//  Created by Ahmed Salah on 15/03/2026.
//

import Foundation

public enum TasksState: Equatable {

    case idle
    case loading
    case loaded([TaskModel])
    case empty
    case error(String)

}
//test fastlan
