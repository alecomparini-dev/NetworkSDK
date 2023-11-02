//  Created by Alessandro Comparini on 20/10/23.
//

import Foundation

public enum PostUseCaseDTO {
    
    public struct Input {
        public let url: URL
        public let headers: [String: String]?
        public let queryParameters: [String: String]?
        public let bodyJson: Data?
        
        public init(url: URL, 
                    headers: [String : String]?,
                    queryParameters: [String : String]?,
                    bodyJson: Data?) {
            self.url = url
            self.headers = headers
            self.queryParameters = queryParameters
            self.bodyJson = bodyJson
        }
        
    }
    
}
