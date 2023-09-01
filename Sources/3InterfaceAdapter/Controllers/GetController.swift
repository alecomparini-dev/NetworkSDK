//
//  File.swift
//  
//
//  Created by Alessandro Comparini on 01/09/23.
//

import Foundation

public protocol GetController {
    func get() async throws -> Data 
}
