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

#if swift(>=5.6)
    package.dependencies.append(
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.1.0")
    )
#endif
