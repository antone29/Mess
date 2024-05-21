//
//  ArticleRow.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/10/24.
//

import SwiftUI
import RealmSwift

struct ArticleRow: View {
    @StateObject var articleModel : ArticleModel
    @ObservedObject private var favoritesViewModel = FavoriteArticleViewModel()
    
//    @EnvironmentObject var manager: DataManager
//    @Environment(\.managedObjectContext) private var viewContext
//    @FetchRequest(sortDescriptors: []) private var todoItems: FetchedResults<Article>
    
    var body: some View {
        NavigationLink(destination: ArticleDetail(articleModel: articleModel)) {
            HStack{
                AsyncImage(url: URL(string:articleModel.imageURL ?? "https://en.wiktionary.org/wiki/newspaper#/media/File:The_Indianapolis_Star,_2011.jpg"),
                           content: { image in
                               image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 100, maxHeight: 100)
                           },
                           placeholder: {
                               ProgressView()
                           }
                )
                VStack(alignment: .leading){
                    Text(articleModel.title.rendered!)
                        .font(.headline)
//                    Text(articleModel.author)
//                        .font(.subheadline)
                    Text(articleModel.content.rendered!)
                        .font(.caption)
                        .lineLimit(3)
                }
                Spacer()
                Button {
                    self.articleModel.isliked.toggle()
                    if articleModel.isliked {
                        favoritesViewModel.addArticle(title: articleModel.title.rendered!, content: articleModel.content.rendered!, author: articleModel.author!)
                        
                       // addItem(article: articleModel)
                    } else {
                      //  favoritesViewModel.deleteArticle(id: articleModel.id)
                       //deleteItem(article: articleModel)
                    }
                    
                } label: {
                    Image(systemName: articleModel.isliked ? "heart.fill" : "heart")
                }


                
            }.padding(10)
                .background(Color("background_yellow"))
                .cornerRadius(15)
            
            
        }
    }
    
//    private func delete(at offsets: IndexSet) {
//           for index in offsets {
//               let todo = todoItems[index]
//               self.viewContext.delete(todo)
//               do {
//                   try viewContext.save()
//                   print("perform delete")
//               } catch {
//                   // handle the Core Data error
//               }
//           }
//       }
    
//    func addItem(article: ArticleModel) {
//        
//        
//        let newFavoriteArticle = Article(context: viewContext)
//        //newFavoriteArticle.author = article.author
//        //newFavoriteArticle.categories = article.categories
//        newFavoriteArticle.content = article.content.rendered
//        newFavoriteArticle.date = article.date
//        newFavoriteArticle.title = article.title.rendered
//        newFavoriteArticle.url = article.imageURL
//        
//        try? viewContext.save()
//        
//    }
    

    
//    func deleteItem(article: Article) {
//        viewContext.delete(article)
//        do {
//            try viewContext.save()
//        } catch {
//            print(error)
//        }
//    }
}
