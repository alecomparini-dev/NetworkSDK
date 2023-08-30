// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "NetworkSDK",
    
    platforms: [
        .iOS(.v14),
        .macOS(.v10_15)
    ],
    
    products: [
        .library(name: "NetworkSDK", targets: ["Network"] ),
    ],
    
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: Version(stringLiteral: "5.7.1")))
    ],
    
    targets: [
        .target(name: "Network", dependencies: ["Alamofire"]),
        
        .testTarget(name: "NetworkTests", dependencies: ["Network"]),
    ]
)
