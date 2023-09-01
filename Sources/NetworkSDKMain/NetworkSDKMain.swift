//  Created by Alessandro Comparini on 01/09/23.
//

import Foundation
import Detail
import Interfaces
import Controllers
import UseCases
import UseCasesGateway

public class NetworkSDKMain {
    
    private let provider = AlamofireProvider()
    
    private let url: URL
    private let headers: Dictionary<String, String>
    private let queryParameters: Dictionary<String, String>
    
    public init(url: URL,
                _ headers: Dictionary<String, String> = [:],
                _ queryParameters: Dictionary<String, String> = [:]) {
        self.url = url
        self.headers = headers
        self.queryParameters = queryParameters
    }
    
    public func get() async throws -> Data {
        
        let httpGetProvider = provider
        let getUseCaseGateway = GetUseCaseGatewayImpl(provider: httpGetProvider)
        let getUseCase = GetUseCaseImpl(getUseCaseGateway: getUseCaseGateway)
        let getController = GetControllerImpl(getUseCase: getUseCase)
        
        let data = try await getController.get()
        
        print("PUTA QUE PARIUUU", data)
        
        return data
    }
    
}
