//
//  OpenSeaAssetsDBRepository.swift
//  marketa
//
//  Created by Heriberto Prieto on 2/21/22.
//

import CoreData
import Combine

protocol OpenSeaAssetsDBRepository {
    func hasLoadedAssets() -> AnyPublisher<Bool, Error>
    
    func store(collection: OSAsset.OSAssetCollection) -> AnyPublisher<OSAsset.OSAssetCollection?, Error>
    func collection(collectionSlug: String) -> AnyPublisher<OSAsset.OSAssetCollection?, Error>
}

struct RealOpenSeaAssetsDBRepository: OpenSeaAssetsDBRepository {
    
    let persistentStore: PersistentStore
    
    func hasLoadedAssets() -> AnyPublisher<Bool, Error> {
        let fetchRequest = OSAssetMO.justOneAsset()
        return persistentStore
            .count(fetchRequest)
            .map { $0 > 0 }
            .eraseToAnyPublisher()
    }
    
    func store(collection: OSAsset.OSAssetCollection) -> AnyPublisher<OSAsset.OSAssetCollection?, Error> {
        return persistentStore
            .update { context in
                return OSAsset.OSAssetCollection(managedObject: collection.store(in: context))
            }
    }
    
    func collection(collectionSlug: String) -> AnyPublisher<OSAsset.OSAssetCollection?, Error> {
        let fetchRequest = OSAssetCollectionMO.collection(collectionSlug: collectionSlug)
        return persistentStore
            .fetch(fetchRequest) {
                OSAsset.OSAssetCollection(managedObject: $0)
            }
            .map { $0.first }
            .eraseToAnyPublisher()
    }
}

// MARK: - Fetch Requests

extension OSAssetMO {
    
    static func justOneAsset() -> NSFetchRequest<OSAssetMO> {
        let tokenIdArg: CVarArg = "" as CVarArg
        let request = newFetchRequest()
        request.predicate = NSPredicate(format: "tokenId == %@", tokenIdArg)
        request.fetchLimit = 1
        return request
    }
    
    static func assets(search: String) -> NSFetchRequest<OSAssetMO> {
        let request = newFetchRequest()
        if search.count == 0 {
            request.predicate = NSPredicate(value: true)
        } else {
            let nameMatch = NSPredicate(format: "name CONTAINS[cd] %@", search)
            let localizedMatch = NSPredicate(format:
            "(SUBQUERY(nameTranslations,$t,$t.name == %@ AND $t.name CONTAINS[cd] %@).@count > 0)", search)
            request.predicate = NSCompoundPredicate(type: .or, subpredicates: [nameMatch, localizedMatch])
        }
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        request.fetchBatchSize = 10
        return request
    }
    
    static func assets(tokenIds: [String]) -> NSFetchRequest<OSAssetMO> {
        let request = newFetchRequest()
        request.predicate = NSPredicate(format: "tokenId in %@", tokenIds)
        request.fetchLimit = tokenIds.count
        return request
    }
}

extension OSAssetCollectionMO {
    static func collection(collectionSlug: String) -> NSFetchRequest<OSAssetCollectionMO> {
        let request = newFetchRequest()
        request.predicate = NSPredicate(format: "collection.name == %@", collectionSlug as CVarArg)
        request.fetchLimit = 1
        return request
    }
}
