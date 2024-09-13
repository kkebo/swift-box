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
                "Box"
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)
