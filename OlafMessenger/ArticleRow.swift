//
//  ArticleRow.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/10/24.
//

import SwiftUI

struct ArticleRow: View {
    var articleModel : ArticleModel
    var body: some View {
        NavigationLink(destination: ArticleDetail(articleModel: articleModel)) {
            HStack{
                Image("mess_logo")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                VStack(alignment: .leading){
                    Text(articleModel.title!)
                        .font(.headline)
//                    Text(articleModel.author)
//                        .font(.subheadline)
                    Text(articleModel.content!)
                        .font(.caption)
                        .lineLimit(3)
                }
//                Button(action:{
//                    
//                }){
//                //    Image(systemName: isLiked ? "heart.fill" : "heart")
//                }
               
                
            }.padding(10)
                .background(Color("background_yellow"))
                .cornerRadius(15)
            
            
        }.padding(10)
    }
}

//#Preview {
//    ArticleRow(articleModel: ArticleModel)
//}
