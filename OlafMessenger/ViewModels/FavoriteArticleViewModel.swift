//
//  FavoriteArticleViewModel.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/21/24.
//

import SwiftUI
import RealmSwift

class FavoriteArticleViewModel: ObservableObject {
    
    
    @ObservedResults(FavoriteArticleModel.self) var favoriteArticlesList
    @Published var articles: [FavoriteArticleModel] = []
    
    private var token: NotificationToken?

    init() {
        setupObserver()
    }

    deinit {
        token?.invalidate()
    }
// fetch and update contactList
    private func setupObserver() {
        do {
            let realm = try Realm()
            let results = realm.objects(FavoriteArticleModel.self)

            token = results.observe({ [weak self] changes in
                self?.articles = results.map(FavoriteArticleModel.init)
                    .sorted(by: { $0.title! > $1.title! })
            })
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func addArticle(title: String, content: String, author: Int) -> String{
        let article = FavoriteArticleModel()
        article.title = title
        article.content = content
        article.author = author
        $favoriteArticlesList.append(article)
        return article.id.stringValue
    }
    
    func deleteArticle(id: String) {
        do {
            let realm = try Realm()
//            try! realm.write {
//                realm.deleteAll()
//                
//            }
            let objectId = try ObjectId(string: id)
            if let article = realm.object(ofType: FavoriteArticleModel.self, forPrimaryKey: objectId) {
                try realm.write {
                    realm.delete(article)
                }
            }
      
        } catch let error {
            print("error here")
            print(error.localizedDescription)
        }
    }
}
