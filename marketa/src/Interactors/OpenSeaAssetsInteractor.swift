//
//  OpenSeaAssetsInteractor.swift
//  marketa
//
//  Created by Heriberto Prieto on 2/21/22.
//

import Combine
import Foundation
import SwiftUI

protocol OpenSeaAssetsInteractor {
    func loadCollection(collectionSlug: String) -> AnyPublisher<OSAsset.OSAssetCollection?, Error>
    func loadCollection(collection: LoadableSubject<OSAsset.OSAssetCollection>, collectionSlug: String)
}

struct RealOpenSeaAssetsInteractor: OpenSeaAssetsInteractor {
    
    let webRepository: OpenSeaAssetsWebRepository
    let dbRepository: OpenSeaAssetsDBRepository
    
    init(webRepository: OpenSeaAssetsWebRepository, dbRepository: OpenSeaAssetsDBRepository) {
        self.webRepository = webRepository
        self.dbRepository = dbRepository
    }
    
    func loadCollection(collectionSlug: String) -> AnyPublisher<OSAsset.OSAssetCollection?, Error> {
        return self.loadAndStoreCollectionFromWeb(collectionSlug: collectionSlug)
    }
    
    func loadCollection(collection: LoadableSubject<OSAsset.OSAssetCollection>, collectionSlug: String) {
        
        let cancelBag = CancelBag()
        collection.wrappedValue.setIsLoading(cancelBag: cancelBag)
        
        dbRepository
            .collection(collectionSlug: collectionSlug)
            .flatMap { collection -> AnyPublisher<OSAsset.OSAssetCollection?, Error> in
                if let collection = collection {
                    return Just<OSAsset.OSAssetCollection?>.withErrorType(collection, Error.self)
                } else {
                    return self.loadAndStoreCollectionFromWeb(collectionSlug: collectionSlug)
                }
            }
            .sinkToLoadable { collection.wrappedValue = $0.unwrap() }
            .store(in: cancelBag)
    }
    
    private func loadAndStoreCollectionFromWeb(collectionSlug: String) -> AnyPublisher<OSAsset.OSAssetCollection?, Error> {
        return webRepository
            .loadCollection(collectionSlug: collectionSlug)
            .ensureTimeSpan(requestHoldBackTimeInterval)
            .flatMap {
                dbRepository.store(collection: $0)
            }
            .eraseToAnyPublisher()
    }
    
    private var requestHoldBackTimeInterval: TimeInterval {
        return ProcessInfo.processInfo.isRunningTests ? 0 : 0.5
    }
}

struct StubOpenSeaAssetsInteractor: OpenSeaAssetsInteractor {
    func loadCollection(collectionSlug: String) -> AnyPublisher<OSAsset.OSAssetCollection?, Error> {
        return Just<OSAsset.OSAssetCollection?>.withErrorType(nil, Error.self)
    }
    
    func loadCollection(collection: LoadableSubject<OSAsset.OSAssetCollection>, collectionSlug: String) { }
}
