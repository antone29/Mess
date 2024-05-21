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
    
}
