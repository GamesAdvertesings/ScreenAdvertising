// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ScreenAdvertising",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ScreenAdvertising",
            targets: ["ScreenAdvertising"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/GamesAdvertesings/Architecture", branch: "main"),
        .package(url: "https://github.com/GamesAdvertesings/AdvertisingBackend", branch: "master"),
        .package(url: "https://github.com/GamesAdvertesings/AdvertisingFlyer", branch: "master"),
        .package(url: "https://github.com/Juanpe/SkeletonView.git", from: "1.7.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ScreenAdvertising",
            dependencies: [
                .product(name: "Architecture", package: "Architecture"),
                .product(name: "AdvertisingBackend", package: "AdvertisingBackend"),
                .product(name: "AdvertisingFlyer", package: "AdvertisingFlyer"),
                .product(name: "SkeletonView", package: "SkeletonView"),
            ]),
    ]
)
