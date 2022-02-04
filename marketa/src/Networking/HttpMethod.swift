//
//  HttpMethod.swift
//  marketa
//
//  Created by Heriberto Prieto on 2/3/22.
//

import Foundation

public enum HttpMethod {
    case delete
    case get
    case post
    case put
    
    public var name: String {
        let name: String
        
        switch self {
        case .delete:
            name = "DELETE"
        case .get:
            name = "GET"
        case .post:
            name = "POST"
        case .put:
            name = "PUT"
        }
        
        return name
    }
}
