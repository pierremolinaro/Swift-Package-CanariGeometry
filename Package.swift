// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
//--------------------------------------------------------------------------------------------------

import PackageDescription

//--------------------------------------------------------------------------------------------------

let package = Package (
  name: "CanariGeometry",
  platforms: [.macOS (.v12)],
  products: [
    .library (name: "CanariGeometry", targets: ["CanariGeometry"])
  ],
//  dependencies: [
//    .package (url: "https://github.com/dankogai/swift-int2x.git", from: "0.4.2")
//  ],
  targets: [
    .target (
      name: "CanariGeometry",
      dependencies: [
  //      .product (name: "Int2X", package: "swift-int2x"])
      ]
    )
  ],
  swiftLanguageModes: [.v6]
)

//--------------------------------------------------------------------------------------------------
