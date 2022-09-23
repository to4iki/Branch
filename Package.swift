// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Branch",
    defaultLocalization: "en",
    platforms: [.iOS(.v13), .macOS(.v10_15), .tvOS(.v13), .watchOS(.v6)],
    products: [
        .library(
            name: "Branch",
            targets: ["Branch"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Branch",
            dependencies: [],
            plugins: [.plugin(name: "BranchPlugin")]),
        .plugin(
            name: "BranchPlugin",
            capability: .buildTool())
    ]
)
