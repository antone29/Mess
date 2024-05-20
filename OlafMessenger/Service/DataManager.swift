//
//  DataManager.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/15/24.
//

import Foundation
import CoreData
import UIKit

/// Main data manager to handle the todo items
class DataManager: NSObject, ObservableObject {
    /// Dynamic properties that the UI will react to
    @Published var favoriteArticles: [Article] = [Article]()
    
    /// Add the Core Data container with the model name
    let container: NSPersistentContainer = NSPersistentContainer(name: "OlafMessenger")
    
    /// Default init method. Load the Core Data container
       override init() {
           super.init()
           container.loadPersistentStores { _, _ in }
       }
    

}
