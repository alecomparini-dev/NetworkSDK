//  Created by Alessandro Comparini on 29/01/24.
//

import Foundation
import NetworkInterfaces

class HTTPPostProviderSpy: HTTPPostProvider {
    public let startTime = Date()
    
    var urls = [URL]()
    var data: Data?
    var completion: ((Result<Data?, Error>) -> Void)?
    
    func simulateError(_ error: Error) {
        completion?(.failure(error))
    }
    
    func simulateSuccess(_ data: Data) {
        completion?(.success(data))
    }
    
    
//  MARK: - METHOD PROVIDER
    
    func post(endpoint: EndpointDTO, bodyDataJSON: Data?) async throws -> ResponseDTO {
            
        return ResponseDTO(statusCode: 200,
                           responseTimeInMilliseconds: 1000)
    }
    
    
    
}
