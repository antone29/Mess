//
//  FavoriteArticleView.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/14/24.
//

import SwiftUI
import CoreData

struct FavoriteArticleView: View {
    @EnvironmentObject var manager: FavoritesDataManager
    //added lines
    @Environment(\.managedObjectContext) private var viewContext
        @FetchRequest(sortDescriptors: []) private var favoriteArticles: FetchedResults<FavoriteArticleModel>

//    
    
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    FavoriteArticleView()
}
