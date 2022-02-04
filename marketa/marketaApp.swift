//
//  marketaApp.swift
//  marketa
//
//  Created by Heriberto Prieto on 2/3/22.
//

import SwiftUI

@main
struct marketaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
