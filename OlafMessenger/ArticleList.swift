//
//  ArticleList.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/10/24.
//

import SwiftUI


struct ArticleList: View {
    //   var myArticle = ArticleModel(json: )

    @StateObject private var articleListModel = ArticleData()
    var category: Int
    
    var body: some View {
        ScrollView{
            ForEach(articleListModel.list){ each in
                ArticleRow(articleModel: each)
            }
        }
        .task {
            await self.articleListModel.getArticleData(page: 1, category: category)
        }
        .refreshable {
            await self.articleListModel.getArticleData(page: 1, category: category)
        }
        
        
    }
}
//
//#Preview {
//    ArticleList(id: 6)
//}
