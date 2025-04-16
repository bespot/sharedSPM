// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "shared",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "shared",
            //type: .dynamic,
            targets: ["shared"]),
    ],
    dependencies: [
        //.package(url: "https://github.com/spvagelis/papertrail-lumberjack-ios.git", exact: "2.1.6")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
//        .target(
//            name: "shared",
//            dependencies: [
//                //.target(name: "shared"),
//                //.product(name: "PaperTrailLumberjack", package: "papertrail-lumberjack-ios")
//            ]
//        ),
        .testTarget(
            name: "sharedTests",
            dependencies: ["shared"]),
        //.binaryTarget(name: "shared", path: "./Sources/shared.xcframework")
        .binaryTarget(name: "shared", 
                      url: "https://github.com/bespot/sharedSPM/releases/download/2.0.4/shared.xcframework.zip", 
                      checksum: "765656bc97f6b8290ad9ba79fbdac447e7ed85689830b5183b7329351487b568")
    ]
)
