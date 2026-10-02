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
//   .package (
//     url: "https://github.com/apple/swift-numerics",
//     from: "1.1.1"
//   )
//  ],
  targets: [
//    .target (
//      name: "C23TrigoBridge",
//      cSettings: [
//          // À décommenter si votre libc fournit sinpi (C23) :
//        .define("PITRIG_HAVE_C23_SINPI"),
//      ]
//    ),
    .target (
      name: "CanariGeometry",
//      dependencies: ["C23TrigoBridge"],
//      dependencies: [.product(name: "Numerics", package: "swift-numerics")]
    )
  ],
  swiftLanguageModes: [.v6],
//  cLanguageStandard: .c2x,
)

//--------------------------------------------------------------------------------------------------
