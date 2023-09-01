// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "NetworkSDK",
    
    platforms: [
        .iOS(.v14),
        .macOS(.v10_15)
    ],
    
    products: [
//        .library(name: "NetworkSDK", targets: ["Main"] ),
    ],
    
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: Version(stringLiteral: "5.7.1")))
    ],
    
    targets: [

        .target(
            name: "NetworkSession",
            dependencies: [  ],
            path: "Sources/3InterfaceAdapter/NetworkSession"
        ),

        .target(
            name: "Interfaces",
            dependencies: [  ],
            path: "Sources/3InterfaceAdapter/Interfaces"
        ),
        
        .target(
            name: "Detail",
            dependencies: ["Interfaces", "Alamofire"],
            path: "Sources/Detail"
        ),
    
        .executableTarget(
            name: "Main",
            dependencies: ["Interfaces"],
            path: "Sources/Main"
        ),
        
    ]
)
