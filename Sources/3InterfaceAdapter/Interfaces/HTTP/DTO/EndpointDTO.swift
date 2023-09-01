//  Created by Alessandro Comparini on 01/09/23.
//

import Foundation

public struct EndpointDTO {
    public let url: URL
    public let headers: Dictionary<String, String>?
    public let queryParameters: Dictionary<String, String>?
    
    public init(url: URL, headers: Dictionary<String, String>?, queryParameters: Dictionary<String, String>?) {
        self.url = url
        self.headers = headers
        self.queryParameters = queryParameters
    }
}
