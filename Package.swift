// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ExtensionsWrapper",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "ExtensionsWrapper",
            targets: ["ExtensionsWrapper"]),
    ],
    targets: [
        .target(
            name: "ExtensionsWrapper",
            dependencies: []),
        .testTarget(
            name: "ExtensionsWrapperTests",
            dependencies: ["ExtensionsWrapper"]),
    ]
)
