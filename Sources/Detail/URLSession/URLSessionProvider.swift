//
//  URLSession.swift
//  currency-conversion-mvp
//
//  Created by Alessandro Comparini on 19/08/23.
//

import Foundation
import NetworkInterfaces

class URLSessionProvider {
    
    private let session: URLSession
    let startTime = Date()
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    private func makeURLComponents(_ endpoint: EndpointDTO) -> URLComponents {
        
        var components = URLComponents(url: endpoint.url, resolvingAgainstBaseURL: false)!
        
        if let queryParameters = endpoint.queryParameters {
            components.queryItems = queryParameters.map { (key, value) in
                URLQueryItem(name: key, value: value)
            }
        }

        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        
        return components
    }
    
}


//  MARK: - EXTENSION - HTTPGetClient
extension URLSessionProvider: HTTPGetProvider {
    
    func get(endpoint: EndpointDTO) async throws -> ResponseDTO {
        
        let components: URLComponents = makeURLComponents(endpoint)
        
        var request = URLRequest(url: components.url!)
        
        request.method = .get

        let (data, response) = try await session.data(for: request)
                
        return ResponseDTOFactory.makeResponseDTO(data: data, response as? HTTPURLResponse, startTime)
        
    }
    
    
}
