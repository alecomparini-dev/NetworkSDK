//  Created by Alessandro Comparini on 19/08/23.
//

import Foundation

import NetworkInterfaces


final public class URLSessionProvider {
    
    public let startTime = Date()
    private let session: URLSession
    
    public init(session: URLSession = .shared) {
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
    
    public func get(endpoint: EndpointDTO) async throws -> ResponseDTO {
        
        let components: URLComponents = makeURLComponents(endpoint)
        
        var request = URLRequest(url: components.url!)
        
        request.method = .get
//        request.timeoutInterval = 25

        let (data, response) = try await session.data(for: request)
                
        return ResponseDTOFactory.makeResponseDTO(data: data, response as? HTTPURLResponse, startTime)
        
    }
    
    
}


//  MARK: - EXTENSION - HTTPGetClient
extension URLSessionProvider: HTTPPostProvider {
    
    public func post(endpoint: EndpointDTO, bodyDataJSON: Data?) async throws -> ResponseDTO {
        
        let components: URLComponents = makeURLComponents(endpoint)
                
        var request = URLRequest(url: components.url!)
        
        request.method = .post
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let bodyDataJSON {
            request.httpBody = bodyDataJSON
        }
        
        let (data, response) = try await session.data(for: request)
        
        return ResponseDTOFactory.makeResponseDTO(data: data, response as? HTTPURLResponse, startTime)
    }
    
}
