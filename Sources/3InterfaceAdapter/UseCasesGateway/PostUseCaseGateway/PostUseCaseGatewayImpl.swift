//  Created by Alessandro Comparini on 20/10/23.
//

import Foundation
import NetworkUseCases
import NetworkInterfaces

final public class PostUseCaseGatewayImpl: PostUseCaseGateway {
    
    private let provider: HTTPPostProvider
    
    public init(provider: HTTPPostProvider) {
        self.provider = provider
    }
    
    public func post(_ input: PostUseCaseDTO.Input) async throws -> Data {
        
        let endpoint = EndpointDTO(url: input.url,
                                   headers: input.headers,
                                   queryParameters: input.queryParameters)
        
        let response: ResponseDTO = try await provider.post(endpoint: endpoint, bodyJson: input.bodyJson )
        
        return response.data ?? Data()
    }
    
    
}
