//
//  File.swift
//  
//
//  Created by Alessandro Comparini on 01/09/23.
//

import Foundation

protocol GetUseCase {
    func perform() async throws -> Data
}
