//  Created by Alessandro Comparini on 01/09/23.
//

import Foundation

protocol NetworkSessionGet {
    func execute() async throws -> Data
}
