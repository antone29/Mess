//
//  FavoriteArticleModel+CoreDataClass.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/15/24.
//
//

import CoreData
import Foundation

// Main data manager to handle the todo items
class FavoritesDataManager: NSObject, ObservableObject {
    
    @Published var favoriteArticles: [FavoriteArticleModel] = [FavoriteArticleModel]()
    
    // Add the Core Data container with the model name
    let container: NSPersistentContainer = NSPersistentContainer(name: "Favorites")
    
    // Default init method. Load the Core Data container
    override init() {
        super.init()
        container.loadPersistentStores { _, _ in }
    }
}
