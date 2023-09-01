//
//  File.swift
//  
//
//  Created by Alessandro Comparini on 01/09/23.
//

import Foundation

enum GetUseCaseDTO {
    
    struct Input {
        let url: URL
        let headers: Dictionary<String, String>?
        let queryParameters: Dictionary<String, String>?
    }
    
}
