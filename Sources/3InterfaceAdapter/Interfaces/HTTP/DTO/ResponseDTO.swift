//
//  ResponseDTO.swift
//  currency-clean-architecture-mvp
//
//  Created by Alessandro Comparini on 29/08/23.
//

import Foundation

public struct ResponseDTO {
    public let data: Data?
    public let statusCode: Int
    public let headers: Dictionary<String, String>?
    public let responseTimeInMilliseconds: TimeInterval
    
    public init(data: Data? = nil, statusCode: Int, headers: Dictionary<String, String>? = nil, responseTimeInMilliseconds: TimeInterval) {
        self.data = data
        self.statusCode = statusCode
        self.headers = headers
        self.responseTimeInMilliseconds = responseTimeInMilliseconds
    }
}
