// swift-tools-version: 6.2
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

    targets: [
        .target(
            name: "TasksFeature"
        )
    ]
)
