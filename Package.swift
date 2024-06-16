// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "swift-box",
    products: [
        .library(
            name: "Box",
            targets: ["Box"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-testing", from: "0.10.0")
    ],
    targets: [
        .target(
            name: "Box",
            dependencies: [],
            swiftSettings: [
                .enableExperimentalFeature("NoncopyableGenerics"),
                .enableExperimentalFeature("MoveOnlyPartialConsumption"),
                .enableExperimentalFeature("BorrowingSwitch"),
            ]
        ),
        .testTarget(
            name: "BoxTests",
            dependencies: [
                "Box",
                .product(name: "Testing", package: "swift-testing"),
            ]
        ),
    ],
    swiftLanguageVersions: [.version("6")]
)
