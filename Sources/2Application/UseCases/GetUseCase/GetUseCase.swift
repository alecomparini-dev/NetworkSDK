//
//  File.swift
//  
//
//  Created by Alessandro Comparini on 01/09/23.
//

import Foundation

public protocol GetUseCase {
    func get(_ input: GetUseCaseDTO.Input) async throws -> Data
}
