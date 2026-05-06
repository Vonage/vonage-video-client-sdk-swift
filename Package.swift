// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let package = Package(
    name: "VonageClientSDKVideo",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "VonageClientSDKVideo",
            targets: ["OpenTok", "VonageClientSDKVideo"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .binaryTarget(name: "OpenTok",
                url: "https://s3.us-east-1.amazonaws.com/artifact.tokbox.com/rel/otkit-ios-sdk-xcframework/vonage-ios-sdk-2.34.0.zip",
                checksum: "b09d508cd93fce4d9f2b256c37b9d74749ddd2d7d1bec7d00483aeb88c9dc190"),
        .target(name: "VonageClientSDKVideo",
                path: "Sources",
                resources: [
                    .process("VonageClientSDKVideo/Resources/selfie_segmentation.tflite"),
                    .copy("VonageClientSDKVideo/Resources/PrivacyInfo.xcprivacy")
                ],
                linkerSettings: [
                    .linkedFramework("Network"),
                    .linkedFramework("VideoToolbox"),
                    .linkedFramework("Accelerate"),
                    .linkedLibrary("c++")
                ]),
        .testTarget(name: "VonageClientSDKVideoTests",
                    dependencies: ["VonageClientSDKVideo"])
    ]
)
