//  Created by Alessandro Comparini on 20/10/23.
//

import Foundation

final public class PostUseCaseImpl: PostUseCase {
    
    private let postUseCaseGateway: PostUseCaseGateway
    
    public init(postUseCaseGateway: PostUseCaseGateway) {
        self.postUseCaseGateway = postUseCaseGateway
    }
    
    public func post(_ input: PostUseCaseDTO.Input) async throws -> Data {
        return try await postUseCaseGateway.post(input)
    }
    
    
}
