//
//  CollectathonApp.swift
//  Collectathon
//
//  Created by Chris Kay on 22/06/2022.
//

import SwiftUI

@main
struct CollectathonApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
