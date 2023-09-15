//  Created by Alessandro Comparini on 01/09/23.
//

import Foundation
import NetworkUseCases
import NetworkInterfaces


final public class GetControllerImpl: GetController {
    
    private let getUseCase: GetUseCase
    
    public init(getUseCase: GetUseCase) {
        self.getUseCase = getUseCase
    }
    
    public func get(_ endpoint: EndpointDTO) async throws -> Data {
        
        let input = GetUseCaseDTO.Input(url: endpoint.url,
                                        headers: endpoint.headers,
                                        queryParameters: endpoint.queryParameters)
        
        let data = try await getUseCase.get(input)
        
        return data
    }
    
    
}
