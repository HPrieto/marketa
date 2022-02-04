//
//  APIResponse.swift
//  marketa
//
//  Created by Heriberto Prieto on 2/3/22.
//

import Foundation

public struct APIResponse<T: Decodable>: Decodable {
    public let error: APIError?
    public let data: T?
    
    private enum CodingKeys: String, CodingKey {
        case error = "error"
        case data = "data"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        error = try container.decodeIfPresent(APIError.self, forKey: .error)
        data = try container.decodeIfPresent(T.self, forKey: .data)
    }
}
