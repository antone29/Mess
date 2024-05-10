//
//  ArticleRow.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/10/24.
//

import SwiftUI

struct ArticleRow: View {
    var body: some View {
        NavigationLink(destination: ArticleDetail()) {
            HStack{
                Image("mess_logo")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                VStack(alignment: .leading){
                    Text("Title")
                        .font(.headline)
                    Text("Author")
                        .font(.subheadline)
                    Text("Preview")
                        .font(.caption)
                }
                Spacer()
                
            }.padding(10)
                .background(Color("background_yellow"))
                .cornerRadius(15)
            
            
        }
    }
}

#Preview {
    ArticleRow()
}
