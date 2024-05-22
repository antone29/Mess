//
//  ArticleData.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/10/24.
//

import Foundation
import UIKit
import SwiftUI
import RealmSwift

@MainActor
class ArticleDataModel : ObservableObject {
    
    @ObservedObject private var favoritesViewModel = FavoriteArticleViewModel()
    
    //create an empty list to put your sorted articles in
    @Published var list: [ArticleModel] = []

    func getArticleData(page: Int, category: Int) async {
        
        //keep in mind that this only returns one category of data(which you pass in which one you want with the id)
        Service().getDataFromServer(page: page, category: category) { data in
 
                if let data = data {
                        for each in data {
                            DispatchQueue.main.async {
                                each.content.replaceCodes()
                                each.title.replaceCodes()
                                let temp = self.initializeFavorites(article: each)
                                each.isliked = temp.isliked
                                each.favoritesId = temp.idValue
                                self.list.append(each)
                            }
                    }
            }
            
        
        }
        
    }
    
    func initializeFavorites (article: ArticleModel) -> (isliked: Bool, idValue : String) {
        for each in favoritesViewModel.articles {
            if (article.title.rendered == each.title)&&(article.author == each.author) {
                //might have an issue here
               // each.id = article.id
                let temp = each.id.stringValue
                return (isliked: true, idValue :temp)
            }
        }
        return (isliked: false, idValue :"temp")
    }
    

    
}
