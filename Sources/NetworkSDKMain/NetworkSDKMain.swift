//  Created by Alessandro Comparini on 01/09/23.
//

import Foundation

import Interfaces

public class NetworkSDKMain {
    
    public init() {}
    
    public func get() async throws -> Data {
        
        print("EXECUTOU O GET !!!!!!")
        return Data(count: 64654654)
    }
    
}
