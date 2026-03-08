//
//  ContentView.swift
//  TaskFlow
//
//  Created by Ahmed Salah on 08/03/2026.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @Environment(\.modelContext) private var context

    var body: some View {
        TasksView(context: context)
    }

}
