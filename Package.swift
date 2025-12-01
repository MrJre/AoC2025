// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AoC2025",
    platforms: [.macOS(.v15)],
    products: [
        .library(
            name: "PuzzleCore",
            targets: ["PuzzleCore"]
        ),
    ],
    targets: [
        .target(
            name: "PuzzleCore",
            dependencies: [
            ]
        ),
    ]
)
