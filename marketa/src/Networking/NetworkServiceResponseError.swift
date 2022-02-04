//
//  NetworkServiceResponseError.swift
//  marketa
//
//  Created by Heriberto Prieto on 2/3/22.
//

import Foundation

/**
 - Description: Errors specifically presented when there are issues with the expected response from the api
 - Authors: Heriberto Prieto
 */
public enum NetworkServiceResponseError: Error {
    case badRequest(errors: [String]?)
    case serialization(error: Error)
    case unhandled(error: Error?)
    
    // MARK: - Init
    
    public init?(statusCode: Int?, errors: [String]? = nil, error: Error? = nil) {
        guard
            statusCode != 200 &&
            statusCode != 201 &&
            statusCode != 204
        else {
            return nil
        }
        
        if statusCode == 400 {
            self = .badRequest(errors: errors)
            return
        }
        
        self = .unhandled(error: error)
    }
}
