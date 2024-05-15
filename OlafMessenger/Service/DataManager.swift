//
//  DataManager.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/15/24.
//

import Foundation
import CoreData

/// Main data manager to handle the todo items
class DataManager: NSObject, ObservableObject {
    /// Dynamic properties that the UI will react to
    @Published var todoItems: [TodoItem] = [TodoItem]()
    
    /// Add the Core Data container with the model name
    let container: NSPersistentContainer = NSPersistentContainer(name: "OlafMessenger")
    
    /// Default init method. Load the Core Data container
       override init() {
           super.init()
           container.loadPersistentStores { _, _ in }
       }
}
