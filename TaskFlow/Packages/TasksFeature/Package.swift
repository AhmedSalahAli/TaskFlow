// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TasksFeature",
    
    platforms: [
        .iOS(.v17)
    ],

    products: [
        .library(
            name: "TasksFeature",
            targets: ["TasksFeature"]
        )
    ],

    dependencies: [
        .package(path: "../Networking") // ✅ مهم جداً
    ],

    targets: [
        .target(
            name: "TasksFeature",
            dependencies: ["Networking"] // ✅ مهم جداً
        )
    ]
)
