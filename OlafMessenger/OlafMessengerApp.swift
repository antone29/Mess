//
//  OlafMessengerApp.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/10/24.
//

import SwiftUI

@main
struct OlafMessengerApp: App {
  //  let persistenceController = PersistenceController.shared
    @StateObject private var manager: DataManager = DataManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manager)
                .environment(\.managedObjectContext, manager.container.viewContext)
        }
    }
}
