//
//  ArticleList.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/10/24.
//

import SwiftUI

struct ArticleList: View {
    //   var myArticle = ArticleModel(json: )
    let id: Int
    @StateObject var articleListModel = ArticleData(id: 6)
    
    init(id: Int) {
        self.id = id
        // self.articleData = ArticleData(id: id)
    }
    
    var body: some View {
        ScrollView{
            ForEach(articleListModel.list){ each in
                ArticleRow(articleModel: each)
                
            }
        }
        .task {
            await self.articleListModel.getArticleData(page: 1)
        }
        .refreshable {
            await self.articleListModel.getArticleData(page: 1)
        }
        
        
    }
}

#Preview {
    ArticleList(id: 6)
}
