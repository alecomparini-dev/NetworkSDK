//
//  File.swift
//  
//
//  Created by Alessandro Comparini on 01/09/23.
//

import Foundation
import UseCases

final public class GetControllerImpl: GetController {
    
    private let getUseCase: GetUseCase
    
    public init(getUseCase: GetUseCase) {
        self.getUseCase = getUseCase
    }
    
    public func get() async throws -> Data {
        
        
        return Data()
    }

    
}
