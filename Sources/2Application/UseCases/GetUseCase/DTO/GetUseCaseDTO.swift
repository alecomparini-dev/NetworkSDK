//  Created by Alessandro Comparini on 01/09/23.
//

import Foundation


public enum GetUseCaseDTO {
    
    public struct Input {
        public let url: URL
        public let headers: [String: String]?
        public let queryParameters: [String: String]?
        
        public init(url: URL, headers: [String : String]?, queryParameters: [String : String]?) {
            self.url = url
            self.headers = headers
            self.queryParameters = queryParameters
        }
        
    }
    
}
