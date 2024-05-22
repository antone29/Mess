//
//  FavoriteArticleModel.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/21/24.
//

import SwiftUI
import RealmSwift

class FavoriteArticleModel: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String?
    @Persisted var content: String?
    @Persisted var url: String?
    @Persisted var date: String?
    @Persisted var author: Int
}
