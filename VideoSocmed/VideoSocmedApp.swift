//
//  VideoSocmedApp.swift
//  VideoSocmed
//
//  Created by Indra on 05/10/20.
//

import SwiftUI

@main
struct VideoSocmedApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            let authState = AuthenticationState.shared
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(authState)
        }
    }
}
