//  Created by Alessandro Comparini on 01/09/23.
//

import Foundation
import UseCases
import Interfaces

final class GetUseCaseGatewayImpl: GetUseCaseGateway {

    private let provider: HTTPGetProvider
    
    init(provider: HTTPGetProvider) {
        self.provider = provider
    }
    
    func get() async throws -> Data {
        
        
        return Data()
    }
    
    
}
