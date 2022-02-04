//
//  Endpoint.swift
//  marketa
//
//  Created by Heriberto Prieto on 2/3/22.
//

import Foundation

protocol Endpoint {
    /// The urlString key from info.plist
    var urlString: String { get }
    /// Request Method Type
    var httpMethod: HttpMethod { get }
    /// API Endpoint Path
    var path: String { get }
    /// URL Encoded Query Parameters (i.e. ?)
    var queryItems: [String : Any] { get }
    /// JSON Encoded Body
    var body: [String: Any]? { get }
}

extension Endpoint {
    
    /**
     Build URLRequest
     */
    func urlRequest() throws -> URLRequest {
        
        guard
            let baseURLString: String = Bundle.main.object(forInfoDictionaryKey: urlString) as? String,
            var urlComponents: URLComponents = URLComponents(string: baseURLString)
        else {
            throw NetworkServiceError.url
        }
        
        urlComponents.path = path
        urlComponents.queryItems = urlQueryItems
        
        guard let url: URL = urlComponents.url else {
            throw NetworkServiceError.url
        }
        
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = httpMethod.name
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let body = self.body,
           let jsonData = JSON.data(from: body),
           httpMethod != .get {
            request.httpBody = jsonData
            print("HttpBody: ", String(data: jsonData, encoding: .utf8) ?? "None.")
        }
        
        return request
    }
    
    public var urlQueryItems: [URLQueryItem] {
        var items: [URLQueryItem] = [URLQueryItem]()
        
        queryItems.forEach{ key, value in
            items.append(
                URLQueryItem(
                    name: key,
                    value: value as? String
                )
            )
        }
        
        return items
    }
}

// MARK: - OrderDirection
public enum QueryOrderDirection: String {
    case asc
    case desc
    
    public var value: String {
        let val: String
        
        switch self {
        case .asc:
            val = "asc"
        case .desc:
            val = "desc"
        }
        
        return val
    }
    
    public var description: String {
        let desc: String
        
        switch self {
        case .asc:
            desc = "ascending"
        case .desc:
            desc = "descending"
        }
        
        return desc
    }
}
