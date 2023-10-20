//  Created by Alessandro Comparini on 20/10/23.
//


import Foundation
import NetworkInterfaces


public protocol PostController {
    func post(_ endpoint: EndpointDTO, bodyJson: [String: Any]) async throws -> Data
}
