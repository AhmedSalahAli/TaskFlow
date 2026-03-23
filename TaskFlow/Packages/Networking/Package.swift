// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Networking",
    
    platforms: [
        .iOS(.v17)
    ],

    products: [
        .library(
            name: "Networking",
            targets: ["Networking"]
        )
    ],

    dependencies: [
        .package(path: "../TasksFeature")
    ],

    targets: [
        .target(
            name: "Networking",
            dependencies: ["TasksFeature"]
        )
    ]
)
