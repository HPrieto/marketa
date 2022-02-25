//
//  DIContainer.swift
//  marketa
//
//  Created by Heriberto Prieto on 2/24/22.
//

import SwiftUI
import Combine

// MARK: - DIContainer

struct DIContainer: EnvironmentKey {
    
    let interactors: Interactors
    
    init(interactors: Interactors) {
        self.interactors = interactors
    }
    
    static var defaultValue: Self { Self.default }
    
    private static let `default` = Self(interactors: .stub)
}

extension EnvironmentValues {
    var injected: DIContainer {
        get { self[DIContainer.self] }
        set { self[DIContainer.self] = newValue }
    }
}

#if DEBUG
extension DIContainer {
    static var preview: Self {
        .init(interactors: .stub)
    }
}
#endif

// MARK: - Injection in the view hierarchy

extension View {
    
    func inject(_ interactors: DIContainer.Interactors) -> some View {
        let container = DIContainer(interactors: interactors)
        return inject(container)
    }
    
    func inject(_ container: DIContainer) -> some View {
        return self
            .modifier(RootViewAppearance())
            .environment(\.injected, container)
    }
}

extension DIContainer {
    struct Interactors {
        let openSeaAssetInteractor: OpenSeaAssetsInteractor
        
        init(openSeaAssetInteractor: OpenSeaAssetsInteractor) {
            self.openSeaAssetInteractor = openSeaAssetInteractor
        }
        
        static var stub: Self {
            .init(openSeaAssetInteractor: StubOpenSeaAssetsInteractor())
        }
    }
}
