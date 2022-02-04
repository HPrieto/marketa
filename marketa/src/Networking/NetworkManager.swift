//
//  NetworkManager.swift
//  marketa
//
//  Created by Heriberto Prieto on 2/3/22.
//

import Foundation

public typealias VoidCompletion = (Result<Void, Swift.Error>) -> Void
public typealias StringCompletion = (Result<String, Swift.Error>) -> Void
public typealias StringsCompletion = (Result<[String], Swift.Error>) -> Void
public typealias GenericCompletion<T> = (Result<T, Swift.Error>) -> Void
public typealias AnyDecodable = Any & Decodable
public typealias SuccessCompletion = (Bool) -> Void

// MARK: - NetworkManager
class NetworkManager {
    
    public static let shared: NetworkManager = NetworkManager()
}

// MARK: - GET
extension NetworkManager {
    
    public func request<T: Decodable>(type: T.Type, from endpoint: Endpoint, completionHandler: @escaping (Swift.Result<T, Swift.Error>) -> Void) {
        
        var request: URLRequest
        do {
            request = try endpoint.urlRequest()
        } catch {
            completionHandler(.failure(error))
            return
        }
        
        let sessionConfig: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: sessionConfig)
        let dataTask: URLSessionDataTask = session.dataTask(with: request) { (data, response, error) in
            if let error = error as NSError?,
               error.code != 200 {
                DispatchQueue.main.async {
                    completionHandler(.failure(error))
                }
                return
            }
            do {
                print(String(data: data!, encoding: .utf8) ?? "")
                let response: T = try JSONDecoder().decode(T.self, from: data!)
                DispatchQueue.main.async {
                    completionHandler(.success(response))
                }
            } catch let err {
                print(err)
                DispatchQueue.main.async {
                    completionHandler(.failure(err))
                }
            }
        }
        dataTask.resume()
    }
}
