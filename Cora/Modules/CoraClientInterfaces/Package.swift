// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "CoraClientInterfaces",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "CoraClientInterfaces",
            targets: ["CoraClientInterfaces"]),
    ],
    targets: [
        .target(
            name: "CoraClientInterfaces"),

    ]
)
