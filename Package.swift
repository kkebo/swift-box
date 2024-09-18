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
        .target(name: "Box"),
        .testTarget(
            name: "BoxTests",
            dependencies: [
                "Box"
            ]
        ),
    ]
)
