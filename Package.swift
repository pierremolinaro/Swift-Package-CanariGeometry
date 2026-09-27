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
  targets: [
    .target (name: "CanariGeometry")
  ],
  swiftLanguageModes: [.v6]
)

//--------------------------------------------------------------------------------------------------
