// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Lottie-SwiftUI",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "Lottie-SwiftUI",
            targets: ["Lottie-SwiftUI"]
        ),
    ],
    dependencies: [
        .package(name: "Lottie", url: "https://github.com/airbnb/lottie-ios.git", .upToNextMajor(from: Version(3, 1, 2)))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Lottie-SwiftUI",
            dependencies: ["Lottie"]
        )
    ]
)
