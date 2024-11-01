// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "CoraClient",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "CoraClient",
            targets: ["CoraClient"])
    ],
    dependencies: [
        .package(name: "CoraClientInterfaces", path: "../CoraClientInterfaces")
    ],
    targets: [
        .target(
            name: "CoraClient",
            dependencies: [
                .product(name: "CoraClientInterfaces", package: "CoraClientInterfaces")
            ]),
        .testTarget(
            name: "CoraClientTests",
            dependencies: ["CoraClient"]
        )
    ]
)
