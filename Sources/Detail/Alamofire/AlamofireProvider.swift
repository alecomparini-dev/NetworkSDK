//
//  AlamofireNetwork.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 19/08/23.
//

import Foundation
import Interfaces
import Alamofire

public final class AlamofireProvider {
    
    public let startTime = Date()
    private let session: Session
    
    public init(session: Session = .default) {
        self.session = session
    }
    
}


//  MARK: - EXTENSION - HTTPGetClient
extension AlamofireProvider: HTTPGetProvider {
    
    public func get(endpoint: EndpointDTO) async throws -> ResponseDTO {
        
        return try await withCheckedThrowingContinuation { continuation in
            session
                .request(endpoint.url, method: .get, parameters: endpoint.queryParameters)
                .responseData { [weak self] response in
                    guard let self else {return}
                    switch(response.result) {
                        case .success(let data):
                            continuation.resume(returning: ResponseDTOFactory.makeResponseDTO(data: data, response.response, startTime))
                        case .failure (let error):
                            continuation.resume(throwing: error )
                    }
                }
        }
        
    }

    
    
}
