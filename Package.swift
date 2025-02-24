// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "sharedSPM",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "sharedSPM",
            type: .dynamic,
            targets: ["sharedSPM"]),
    ],
    dependencies: [
        .package(url: "https://github.com/spvagelis/papertrail-lumberjack-ios.git", exact: "2.1.6")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "sharedSPM",
            dependencies: [
                .target(name: "shared"),
                .product(name: "PaperTrailLumberjack", package: "papertrail-lumberjack-ios")
            ]
        ),
        .testTarget(
            name: "sharedTests",
            dependencies: ["sharedSPM"]),
        .binaryTarget(name: "shared",
                      url: "https://github.com/bespot/sharedSPM/releases/download/1.0.13/shared.xcframework.zip",
                      checksum: "6816d4c401cc4ccb1a6659866fdeae84e0d569afadc5e949748f91642bbaebba")
    ]
)
