// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUIRoundedNavBarTitleFont",
    platforms: [
        .macOS(.v13),
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "SwiftUIRoundedNavBarTitleFont",
            targets: ["SwiftUIRoundedNavBarTitleFont"]),
    ],
    targets: [
        .target(
            name: "SwiftUIRoundedNavBarTitleFont"),
        .testTarget(
            name: "SwiftUIRoundedNavBarTitleFontTests",
            dependencies: ["SwiftUIRoundedNavBarTitleFont"]),
    ]
)
