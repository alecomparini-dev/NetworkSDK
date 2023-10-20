//  Created by Alessandro Comparini on 20/10/23.
//

import Foundation

import NetworkUseCases
import NetworkInterfaces


final public class PostControllerImpl: PostController {
    
    private let postUseCase: PostUseCase
    
    public init(postUseCase: PostUseCase) {
        self.postUseCase = postUseCase
    }
    
    public func post(_ input: EndpointDTO, bodyJson: [String : Any]) async throws -> Data {
        
        let input = PostUseCaseDTO.Input(url: input.url,
                                         headers: input.headers,
                                         queryParameters: input.queryParameters,
                                         bodyJson: bodyJson )
        
        let data = try await postUseCase.post(input)
        
        return data
    }
    
    
}
