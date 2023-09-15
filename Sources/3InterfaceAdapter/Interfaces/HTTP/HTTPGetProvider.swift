//  Created by Alessandro Comparini on 19/08/23.
//

import Foundation


public protocol HTTPGetProvider {
    var startTime: Date { get }
    func get(endpoint: EndpointDTO) async throws -> ResponseDTO
}

