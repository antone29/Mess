//
//  ArticleList.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/10/24.
//

import SwiftUI


struct ArticleList: View {

    @State var page = 1
    @StateObject private var articleListModel = ArticleDataModel()
    var category: Int
    
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach (articleListModel.list, id: \.self){ each in
                    ArticleRow(articleModel: each)
                }
                ProgressView()
                    .onAppear{
                        self.page += 1
                        Task{
                            await self.articleListModel.getArticleData(page: page, category: category)
                        }
                    }
            }.task{
                await self.articleListModel.getArticleData(page: 1, category: category)
            }
        }

    }
    
    
    
}

//
//#Preview {
//    ArticleList(id: 6)
//}
