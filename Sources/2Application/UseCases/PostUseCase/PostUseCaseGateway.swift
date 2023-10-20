//  Created by Alessandro Comparini on 20/10/23.
//

import Foundation

public protocol PostUseCaseGateway {
    func post(_ input: PostUseCaseDTO.Input) async throws -> Data
}
