//  Created by Alessandro Comparini on 01/09/23.
//

import Foundation
import NetworkDetail
import NetworkInterfaces
import NetworkControllers
import NetworkUseCases
import NetworkUseCasesGateway


public class NetworkSDK {
    
    private let provider = AlamofireProvider()
    
    private let endpoint: EndpointDTO
    
    public init(endpoint: EndpointDTO) {
        self.endpoint = endpoint
    }
    
    public func get() async throws -> Data {
        
        let httpGetProvider = provider
        
        let getUseCaseGateway = GetUseCaseGatewayImpl(provider: httpGetProvider)
        
        let getUseCase = GetUseCaseImpl(getUseCaseGateway: getUseCaseGateway)
        
        let getController = GetControllerImpl(getUseCase: getUseCase)
        
        let data = try await getController.get(endpoint)
        
        return data
    }
    
}
