//
//  FavoriteArticleView.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/15/24.
//

import SwiftUI

struct FavoriteArticleView: View {
    @EnvironmentObject var manager: DataManager
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) private var todoItems: FetchedResults<Article>
    
    @ObservedObject private var favoritesViewModel = FavoriteArticleViewModel()
    
    var body: some View {
        
        List {
            if !favoritesViewModel.articles.isEmpty {
                ForEach(favoritesViewModel.articles, id: \.self) { item in
                    ArticleRow(articleModel: ArticleModel(date: item.date, title: item.title ?? "", content: item.content ?? "", author: 0, categories:  [0], imageURL: item.url, isliked: true))
                }
                .onDelete(perform: delete)
            }
        }
        .navigationTitle("Favorites")
        
    }
    private func delete(at offsets: IndexSet) {
           for index in offsets {
               let todo = todoItems[index]
               self.viewContext.delete(todo)
               do {
                   try viewContext.save()
                   print("perform delete")
               } catch {
                   // handle the Core Data error
               }
           }
       }

    
    func addItem(article: ArticleModel) {
        
        
        let newFavoriteArticle = Article(context: viewContext)
        //newFavoriteArticle.author = article.author
        //newFavoriteArticle.categories = article.categories
        newFavoriteArticle.content = article.content.rendered
        newFavoriteArticle.date = article.date
        newFavoriteArticle.title = article.title.rendered
        newFavoriteArticle.url = article.imageURL
        
        try? viewContext.save()
        
    }
    
    
}

//func presentTextInputAlert(title: String, message: String, completion: @escaping (_ text: String) -> Void) {
//    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//    alert.addTextField()
//    let submitAction = UIAlertAction(title: "Save", style: .default) { _ in
//        if let text = alert.textFields?.first?.text, !text.isEmpty {
//            completion(text)
//        }
//    }
//    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//    alert.addAction(submitAction)
//    UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
//}

#Preview {
    FavoriteArticleView()
}
