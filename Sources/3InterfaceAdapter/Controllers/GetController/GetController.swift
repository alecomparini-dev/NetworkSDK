//  Created by Alessandro Comparini on 01/09/23.
//

import Foundation
import NetworkInterfaces

public protocol GetController {
    func get(_ endpoint: EndpointDTO) async throws -> Data
    
}
