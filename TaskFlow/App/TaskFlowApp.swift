//
//  TaskFlowApp.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 07/03/2026.
//

import SwiftUI
import SwiftData
import TasksFeature

@main
struct TaskFlowApp: App {

    var body: some Scene {

        WindowGroup {

            ContentView()

        }
        .modelContainer(for: TaskEntity.self)

    }

}
