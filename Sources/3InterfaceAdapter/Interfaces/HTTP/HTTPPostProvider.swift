//  Created by Alessandro Comparini on 19/08/23.
//

import Foundation


public protocol HTTPPostProvider {
    var startTime: Date { get }
    func post(endpoint: EndpointDTO, bodyDataJSON: Data?) async throws -> ResponseDTO
}

