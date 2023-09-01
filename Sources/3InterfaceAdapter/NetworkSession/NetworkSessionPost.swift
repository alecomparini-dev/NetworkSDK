//  Created by Alessandro Comparini on 01/09/23.
//

import Foundation

protocol SessionPost {
    func execute() async throws -> Data
}
