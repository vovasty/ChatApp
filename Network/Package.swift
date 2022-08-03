// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "Network",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(
            name: "Network",
            targets: ["Network"]
        ),
    ],
    dependencies: [
        .package(path: "../DataModel"),
        .package(path: "../ViewModel"),
    ],
    targets: [
        .target(
            name: "Network",
            dependencies: ["ViewModel", "DataModel"]
        ),
        .testTarget(
            name: "NetworkTests",
            dependencies: ["Network"],
            resources: [
                .copy("MessageList.json"),
                .copy("MessageListBad.json"),
            ]
        ),
    ]
)
