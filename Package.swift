// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Box",
    products: [
        .library(
            name: "Box",
            targets: ["Box"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Box",
            dependencies: []
        ),
        .testTarget(
            name: "BoxTests",
            dependencies: ["Box"]
        ),
    ]
)
