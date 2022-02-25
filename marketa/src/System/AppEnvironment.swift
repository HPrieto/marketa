//
//  AppEnvironment.swift
//  marketa
//
//  Created by Heriberto Prieto on 2/24/22.
//

import UIKit
import Combine

struct AppEnvironment {
    let container: DIContainer
}

extension AppEnvironment {
    
    static func bootstrap() -> AppEnvironment {
        let session = configuredURLSession()
        let webRepositories = configuredWebRepositories(session: session)
        let dbRepositories = configuredDBRepositories()
        let interactors = configuredInteractors(
            dbRepositories: dbRepositories,
            webRepositories: webRepositories
        )
        let diContainer = DIContainer(interactors: interactors)
        return AppEnvironment(container: diContainer)
    }
    
    private static func configuredURLSession() -> URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 120
        configuration.waitsForConnectivity = true
        configuration.httpMaximumConnectionsPerHost = 5
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        configuration.urlCache = .shared
        return URLSession(configuration: configuration)
    }
    
    private static func configuredWebRepositories(session: URLSession) -> DIContainer.WebRepositories {
        let openSeaAssetsRepository = RealOpenSeaAssetsWebRepository(
            session: session,
            baseURL: "https://api.opensea.io/api/v1/"
        )
        return .init(openSeaAssetsRepository: openSeaAssetsRepository)
    }
    
    private static func configuredDBRepositories() -> DIContainer.DBRepositories {
        let persistentStore = CoreDataStack(version: CoreDataStack.Version.actual)
        let openSeaAssetsRepository = RealOpenSeaAssetsDBRepository(persistentStore: persistentStore)
        return .init(openSeaAssetsRepository: openSeaAssetsRepository)
    }
    
    private static func configuredInteractors(dbRepositories: DIContainer.DBRepositories, webRepositories: DIContainer.WebRepositories) -> DIContainer.Interactors {
        let openSeaInteractor = RealOpenSeaAssetsInteractor(
            webRepository: webRepositories.openSeaAssetsRepository,
            dbRepository: dbRepositories.openSeaAssetsRepository
        )
        return .init(openSeaAssetInteractor: openSeaInteractor)
    }
}

extension DIContainer {
    struct WebRepositories {
        let openSeaAssetsRepository: OpenSeaAssetsWebRepository
    }
    
    struct DBRepositories {
        let openSeaAssetsRepository: OpenSeaAssetsDBRepository
    }
}
