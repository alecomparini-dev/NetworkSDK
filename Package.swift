// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "NetworkSDK",
    
    platforms: [
        .iOS(.v14),
        .macOS(.v10_15)
    ],
    
    products: [
        .library(name: "NetworkSDK", targets: ["NetworkSDK"] ),
    ],
    
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: Version(stringLiteral: "5.7.1")))
    ],
    
    targets: [

        .target(
            name: "NetworkUseCases",
            dependencies: [ ],
            path: "Sources/2Application/UseCases"
        ),


        .target(
            name: "NetworkUseCasesGateway",
            dependencies: [
                "NetworkUseCases"
            ],
            path: "Sources/3InterfaceAdapter/UseCasesGateway"
        ),

        .target(
            name: "NetworkControllers",
            dependencies: [
                "NetworkUseCases",
                "NetworkInterfaces"
            ],
            path: "Sources/3InterfaceAdapter/Controllers"
        ),

        .target(
            name: "NetworkInterfaces",
            dependencies: [  ],
            path: "Sources/3InterfaceAdapter/Interfaces"
        ),
        
        
        .target(
            name: "NetworkDetail",
            dependencies: [
                "NetworkInterfaces",
                "Alamofire"
            ],
            path: "Sources/Detail"
        ),
        
        
        
        .target(
            name: "NetworkSDK",
            dependencies: [
                "NetworkInterfaces",
                "NetworkDetail",
                "NetworkUseCasesGateway"
            ],
            path: "Sources/NetworkSDKMain"
        ),
        
    ]
)
