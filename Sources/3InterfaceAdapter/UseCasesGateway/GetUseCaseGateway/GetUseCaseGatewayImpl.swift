//  Created by Alessandro Comparini on 01/09/23.
//

import Foundation
import NetworkUseCases
import NetworkInterfaces

final public class GetUseCaseGatewayImpl: GetUseCaseGateway {

    private let provider: HTTPGetProvider
    
    public init(provider: HTTPGetProvider) {
        self.provider = provider
    }
    
    public func get(_ input: GetUseCaseDTO.Input) async throws -> Data {
        
        let endpoint = EndpointDTO(url: input.url,
                                   headers: input.headers,
                                   queryParameters: input.queryParameters)
        
        let response: ResponseDTO = try await provider.get(endpoint: endpoint)
        
        return response.data ?? Data()
    }
    
}
