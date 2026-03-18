//
//  File.swift
//  TasksFeature
//
//  Created by Ahmed Salah on 12/03/2026.
//

import Foundation

extension TaskDTO {

    func toDomain() -> TaskModel {
        TaskModel(
            id: id,
            title: title,
            completed: completed
        )
    }

}
