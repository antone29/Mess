//
//  FavoriteArticleModel.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/10/24.
//

import Foundation
import CoreData
import UIKit
import SwiftUI
//import RealmSwift


class FavoriteArticleModel:  NSObject, ObservableObject, Identifiable  {
    var taskName: String
    @Published var isCompleted: Bool = false
    
    init(task: String) {
        taskName = task
    }
    //  var date: String?
//    @Published var title: String
//    var content: String
//   // var categories: [Int]?
//    var image: String
////    
//    init(title: String, content: String, image: String) {
//        self.title = title
//        self.content = content
//        self.image = image
//    }
//    static func create(withArticle article: ArticleModel) -> FavoriteArticleModel {
//        let favorite = FavoriteArticleModel()
//        
//        favorite.date = article.date
//        favorite.title = article.title
//        favorite.content = article.content
//        favorite.categories = article.categories
//        favorite.url = article.url
//        
//        return favorite
//    }
//    
    
}
