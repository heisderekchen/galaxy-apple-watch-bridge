// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "GalaxyBridgeSources",
    platforms: [.iOS(.v17), .watchOS(.v10)],
    products: [.library(name: "GalaxyBridgeModels", targets: ["GalaxyBridgeModels"])],
    targets: [
        .target(name: "GalaxyBridgeModels", path: "Sources", sources: ["NotificationEnvelope.swift"])
    ]
)

