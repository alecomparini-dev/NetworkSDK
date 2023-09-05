//
//  ResponseDTO.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 29/08/23.
//

import Foundation

public struct Response {
    public let data: Data?
    public let statusCode: Int
    public let headers: [String: String]?
    public let responseTimeInMilliseconds: TimeInterval
    
    
    
    
}
