//
//  OpenSeaAPIRepository.swift
//  marketa
//
//  Created by Heriberto Prieto on 2/18/22.
//

import Combine
import Foundation

protocol OpenSeaAssetsWebRepository: WebRepository {
    func loadCollection(collectionSlug: String) -> AnyPublisher<OSAsset.OSAssetCollection, Error>
    // func loadAssetsByCollection(collection: String) -> AnyPublisher<[OSAsset], Error>
}

struct RealOpenSeaAssetsWebRepository: OpenSeaAssetsWebRepository {
    
    let session: URLSession
    let baseURL: String
    let bgQueue = DispatchQueue(label: "gb_parse_queue")
    
    init(session: URLSession, baseURL: String) {
        self.session = session
        self.baseURL = baseURL
    }
    
    /// https://api.opensea.io/api/v1/collection/{collection_slug}
    /// Used for retrieving more in-depth information about individual collections,
    /// including real time statistics like floor price
    ///
    /// - parameters:
    ///     - collectionSlug: The collection slug of this collection that is used to uniquely link to this collection on OpenSea
    func loadCollection(collectionSlug: String) -> AnyPublisher<OSAsset.OSAssetCollection, Error> {
        let request: AnyPublisher<OSAsset.OSAssetCollection, Error> = call(endpoint: API.collection(collectionSlug))
        return request
    }
}

extension RealOpenSeaAssetsWebRepository {
    enum API {
        case assets
        case collection(String)
        // case collectionAssets(String)
    }
}

extension RealOpenSeaAssetsWebRepository.API: APICall {
    var path: String {
        switch self {
        case .assets:
            return "/assets"
        case let .collection(collectionSlug):
            return "/collection/\(collectionSlug)"
//        case let .collectionAssets(name):
//            let encodedName = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
//            return "/assets?collection=\(encodedName)"
        }
    }
    
    var method: String {
        switch self {
        case .assets, .collection: //.collectionAssets:
            return "GET"
        }
    }
    
    var headers: [String: String]? {
        return [
            "Accept": "application/json"
        ]
    }
    
    func body() throws -> Data? {
        return nil
    }
}
