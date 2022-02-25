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
    
    private var appEnvironment: AppEnvironment {
        AppEnvironment.bootstrap()
    }
    
    var body: some Scene {
        WindowGroup {
            if ProcessInfo.processInfo.isRunningTests {
                Text("Running Unit Tests.")
            } else {
                ContentView(container: appEnvironment.container)
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
}
