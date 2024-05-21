//
//  FavoriteArticleView.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/15/24.
//

import SwiftUI

struct FavoriteArticleView: View {

    @ObservedObject private var favoritesViewModel = FavoriteArticleViewModel()
    
    var body: some View {
        
        List {
            if !favoritesViewModel.articles.isEmpty {
                ForEach(favoritesViewModel.articles, id: \.self) { item in
                    ArticleRow(articleModel: ArticleModel(date: item.date, title: item.title ?? "", content: item.content ?? "", author: 0, categories:  [0], imageURL: item.url, isliked: true))
                }
            }
        }
        .navigationTitle("Favorites")
        
    }

    
    
}



#Preview {
    FavoriteArticleView()
}
