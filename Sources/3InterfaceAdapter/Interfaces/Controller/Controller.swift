
//  Created by Alessandro Comparini on 01/09/23.
//

import Foundation

public protocol Controller {
    func perform() async throws -> Data
}
