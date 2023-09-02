// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "NetworkSDK",
    
    platforms: [
        .iOS(.v14),
        .macOS(.v10_15)
    ],
    
    products: [
        .library(name: "NetworkSDK", targets: ["NetworkSDKMain"] ),
    ],
    
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: Version(stringLiteral: "5.7.1")))
    ],
    
    targets: [

        .target(
            name: "UseCases",
            dependencies: [ ],
            path: "Sources/2Application/UseCases"
        ),


        .target(
            name: "UseCasesGateway",
            dependencies: [ "UseCases" ],
            path: "Sources/3InterfaceAdapter/UseCasesGateway"
        ),

        .target(
            name: "Controllers",
            dependencies: [ "UseCases", "Interfaces"],
            path: "Sources/3InterfaceAdapter/Controllers"
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
        
        
        
        .target(
            name: "NetworkSDKMain",
            dependencies: ["Interfaces", "Detail", "Controllers", "UseCasesGateway"],
            path: "Sources/NetworkSDKMain"
        ),
        
    ]
)
