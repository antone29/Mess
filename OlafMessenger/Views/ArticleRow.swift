//
//  ArticleRow.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/10/24.
//

import SwiftUI

struct ArticleRow: View {
    @StateObject var articleModel : ArticleModel
    
    @EnvironmentObject var manager: DataManager
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) private var todoItems: FetchedResults<Article>
    
    var body: some View {
        NavigationLink(destination: ArticleDetail(articleModel: articleModel)) {
            HStack{
                Image("mess_logo")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
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
                        addItem(article: articleModel)
                    } else {
                       //deleteItem(article: articleModel)
                    }
                    
                } label: {
                    Image(systemName: articleModel.isliked ? "heart.fill" : "heart")
                }
//                Button (role: .destructive) {
//                    withAnimation {
//                        viewContext.delete(articleModel)
//                        do {
//                            try viewContext.save()
//                        } catch {
//                            // show error
//                        }
//                    }
//                } label: {
//                    Label("Delete", systemImage: "trash")
//                }

                
            }.padding(10)
                .background(Color("background_yellow"))
                .cornerRadius(15)
            
            
        }
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
    
    func deleteItem(article: Article) {
        viewContext.delete(article)
        do {
            try viewContext.save()
        } catch {
            print(error)
        }
    }
}
