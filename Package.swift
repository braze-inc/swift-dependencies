// swift-tools-version: 5.6

import PackageDescription

let package = Package(
  name: "swift-dependencies",
  platforms: [
    .iOS(.v11),
    .macCatalyst(.v13),
    .tvOS(.v11),
    .macOS(.v11),
    .watchOS(.v4),
  ],
  products: [
    .library(
      name: "Dependencies",
      targets: ["Dependencies"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/google/swift-benchmark", from: "0.1.0"),
    .package(url: "https://github.com/braze-inc/xctest-dynamic-overlay", branch: "braze"),
  ],
  targets: [
    .target(
      name: "Dependencies",
      dependencies: [
        .product(name: "XCTestDynamicOverlay", package: "xctest-dynamic-overlay"),
      ]
    ),
    .testTarget(
      name: "DependenciesTests",
      dependencies: [
        "Dependencies"
      ]
    ),
    .executableTarget(
      name: "swift-dependencies-benchmark",
      dependencies: [
        "Dependencies",
        .product(name: "Benchmark", package: "swift-benchmark"),
      ]
    ),
  ]
)

#if swift(>=5.6)
  // Add the documentation compiler plugin if possible
  package.dependencies.append(
    .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0")
  )
#endif

//for target in package.targets {
//  target.swiftSettings = target.swiftSettings ?? []
//  target.swiftSettings?.append(
//    .unsafeFlags([
//      "-Xfrontend", "-warn-concurrency",
//      "-Xfrontend", "-enable-actor-data-race-checks",
//      "-enable-library-evolution",
//    ])
//  )
//}
