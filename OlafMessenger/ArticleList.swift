//
//  ArticleList.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/10/24.
//

import SwiftUI

struct ArticleList: View {
    var body: some View {
        ScrollView{
            ForEach((0..<10)){_ in
                ArticleRow()
                    
            }
        }
        
    }
}

#Preview {
    ArticleList()
}
