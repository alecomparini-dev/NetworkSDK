//  Created by Alessandro Comparini on 29/01/24.
//

import Foundation

import Foundation

open class InterceptorRequestStub: URLProtocol {
    public static var notify: ((URLRequest) -> Void)?
    public static var data: Data?
    public static var response: HTTPURLResponse? 
    public static var error: Error?
    
    
    public static func observeRequest(completion: @escaping (URLRequest) -> Void) {
        InterceptorRequestStub.notify = completion
    }
    
    public static func simulate(data: Data?, response: HTTPURLResponse?, error: Error? ) {
        InterceptorRequestStub.data = data
        InterceptorRequestStub.response = response
        InterceptorRequestStub.error = error
    }
    
    
    //  MARK: - Method for intercept request
    override open class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override open class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override open func startLoading() {
        InterceptorRequestStub.notify?(request)
        
        if let data = InterceptorRequestStub.data {
            client?.urlProtocol(self, didLoad: data)
        }
        
        if let response = InterceptorRequestStub.response {
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        }
        
        if let error = InterceptorRequestStub.error {
            client?.urlProtocol(self, didFailWithError: error)
        }
        
        client?.urlProtocolDidFinishLoading(self)
    }

    override open func stopLoading() {}
}
