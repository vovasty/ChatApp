// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "DataModel",
    products: [
        .library(
            name: "DataModel",
            targets: ["DataModel"]
        ),
    ],
    targets: [
        .target(
            name: "DataModel",
            dependencies: []
        ),
        .testTarget(
            name: "DataModelTests",
            dependencies: ["DataModel"],
            resources: [
                .copy("MessageList.json"),
                .copy("NewMessage.json"),
            ]
        ),
    ]
)
