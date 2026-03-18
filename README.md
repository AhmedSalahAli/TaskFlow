
# TaskFlow — iOS Clean Architecture Example

TaskFlow is an iOS application built using **Clean Architecture** and **Modular Feature-based design**.
The project demonstrates how production iOS applications can be structured in scalable and testable layers.

The goal of this project is to simulate a **real-world company architecture** using modern Swift technologies.

---

# Features

* Fetch tasks from remote API
* Offline-first data strategy
* Local caching using SwiftData
* State-driven UI
* Modular architecture
* Unit tested business logic

---

# Technologies

* Swift
* SwiftUI
* Swift Concurrency (async/await)
* SwiftData
* Combine
* XCTest

---

# Architecture

The project follows **Clean Architecture** principles.

Layers:

Presentation → Domain → Data → Infrastructure

Flow:

View
↓
ViewModel
↓
UseCase
↓
Repository
↓
DataSources
↓
API / Database

---

# Project Structure

App
│
├── AppContainer
│
├── Core
│
├── Networking
│   ├── APIEndpoint
│   ├── NetworkService
│   ├── APIService
│   ├── NetworkClient
│   └── NetworkError
│
└── TasksFeature
├── Models
│   └── TaskModel
│
├── DTO
│   └── TaskDTO
│
├── Mappers
│   └── TaskMapper
│
├── DataSources
│   ├── Remote
│   │   └── TaskRemoteDataSource
│   │
│   └── Local
│       └── TaskLocalDataSource
│
├── Repository
│   ├── TaskRepository
│   └── DefaultTaskRepository
│
├── UseCases
│   └── FetchTasksUseCase
│
├── ViewModels
│   └── TasksViewModel
│
└── Views
└── TasksView

---

# Data Flow

Remote API
↓
Repository
↓
Save to Local Database
↓
Read from Local Database
↓
Return Domain Model to UI

This pattern implements:

* Offline First Strategy
* Single Source of Truth

---

# Dependency Injection

Dependencies are created inside the **AppContainer**.

AppContainer is responsible for constructing:

APIService
↓
TaskRemoteDataSource
↓
TaskLocalDataSource
↓
DefaultTaskRepository
↓
FetchTasksUseCase
↓
TasksViewModel

This pattern is known as **Composition Root**.

---

# Testing

Business logic is tested using **Unit Tests**.

Tested components:

* FetchTasksUseCase
* TasksViewModel

Mocks are used to isolate logic from networking and database layers.

Example:

MockTaskRepository allows testing logic without real API calls.

---

# Architectural Patterns Used

* Clean Architecture
* Feature-based Modular Architecture
* Repository Pattern
* DTO Pattern
* Mapper Pattern
* Dependency Injection
* Offline First Strategy
* State-driven UI
* Unit Testing

---

# Future Improvements

The following production patterns will be implemented later:

* Cache + Refresh Strategy
* Pagination
* Retry Strategy
* Request Deduplication

---

# Author

iOS Developer practicing production-level architecture using SwiftUI.
