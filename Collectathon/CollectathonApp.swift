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

    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}
