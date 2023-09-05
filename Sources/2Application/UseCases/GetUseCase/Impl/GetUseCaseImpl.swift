
//  Created by Alessandro Comparini on 01/09/23.
//

import Foundation

final public class GetUseCaseImpl: GetUseCase  {

    private let getUseCaseGateway: GetUseCaseGateway
        
    public init(getUseCaseGateway: GetUseCaseGateway) {
        self.getUseCaseGateway = getUseCaseGateway
    }
    
    
    public func get(_ input: GetUseCaseDTO.Input) async throws -> Data {
        return try await getUseCaseGateway.get(input)
    }
    
    
    
}
