//  Created by Alessandro Comparini on 01/09/23.
//

import Foundation
import UseCases
import Interfaces

final public class GetUseCaseGatewayImpl: GetUseCaseGateway {

    private let provider: HTTPGetProvider
    
    public init(provider: HTTPGetProvider) {
        self.provider = provider
    }
    
    public func get() async throws -> Data {
        
        
        return Data()
    }
    
    
}
