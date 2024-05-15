//
//  OlafMessengerApp.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/10/24.
//

import SwiftUI

@main
struct OlafMessengerApp: App {
   // let persistenceController = PersistenceController.shared
    @StateObject private var dataController = FavoritesDataManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataController)
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
