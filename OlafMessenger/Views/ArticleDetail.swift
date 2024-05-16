//
//  ArticleDetail.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/10/24.
//

import SwiftUI

struct ArticleDetail: View {
    var articleModel : ArticleModel
    
    var url = "https://t3.gstatic.com/licensed-image?q=tbn:ANd9GcS4WH3Cpe1X75X4LhbHdyJo3vPEs0ufiHQhHjkqEnMjbPqViSEVI-nqF0NpeLscSR-7"
    var body: some View {
        ScrollView{
            VStack(alignment: .center){
                AsyncImage(url: URL(string:url ))
                    .frame(width: 50, height: 50)
                    .clipped()
                Text(articleModel.title.rendered ?? "Title Not Available")
                    .font(.title)
                //            Text(articleModel.author)
                //                .font(.caption)
                Text(articleModel.content.rendered!)
            }.padding(10)
        }
    }
}

//#Preview {
//    ArticleDetail()
//}
