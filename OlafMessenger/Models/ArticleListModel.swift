//
//  ArticleListModel.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/13/24.
//

import Foundation

//@MainActor
class ArticleListModel: ObservableObject {
    @Published var articles : [ArticleModel] = []
    let base = "https://www.theolafmessenger.com/wp-json/wp/v2/posts?per_page=10&page="
    let page = "1"
    let other = "&_fields=title,categories,rendered,author,jetpack_featured_media_url,content,publishedAt,date&orderby=date&categories="
    let section = "6"
    
    
    func reload() async {
        let url = URL(string: base + page + other + section)!
            let urlSession = URLSession.shared
        do {
            let (data, response) = try! await urlSession.data(from: url)
            self.articles = try JSONDecoder().decode([ArticleModel].self, from: data)
        } catch {
            // Error handling in case the data couldn't be loaded
               // For now, only display the error on the console
               debugPrint("Error loading \(url): \(String(describing: error))")
        }
    }
}
