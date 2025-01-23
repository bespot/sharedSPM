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
        .package(url: "https://github.com/CocoaLumberjack/CocoaLumberjack.git", from: "3.8.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "sharedSPM",
            dependencies: [
                .target(name: "shared"),
                .product(name: "CocoaLumberjack", package: "CocoaLumberjack")
            ]
        ),
        .testTarget(
            name: "sharedTests",
            dependencies: ["sharedSPM"]),
        .binaryTarget(name: "shared",
                      url: "https://github.com/bespot/sharedSPM/releases/download/1.0.2/shared.xcframework.zip",
                      checksum: "69b0116782f62fb073473445d4ccce3962f54e4d5c016199698648a6f2f1cc93")
    ]
)
