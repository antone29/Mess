//
//  ArticleModel.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/16/24.
//

import Foundation
import SwiftUI
import RealmSwift

protocol CleanText {
    var rendered: String? { get }
    mutating func replaceCodes ()
}

// MARK: - ArticleModel
class ArticleModel: Codable, ObservableObject, Identifiable {
  
    var id = UUID()
    var favoritesId : String?
    let date: String?
    var title: Title
    var content: Content
    let author: Int?
    let categories: [Int]
    let imageURL: String?
    @Published var isliked = false
    
    enum CodingKeys: String, CodingKey {
        case date, title, content, author, categories
        case imageURL = "jetpack_featured_media_url"
    }
    
    init(date: String?, title: String, content: String, author: Int?, categories: [Int], imageURL: String?, isliked: Bool) {
        self.date = date
        self.title = Title.init(rendered: title)
        self.content = Content.init(rendered: content, protected: true)
        self.author = author
        self.categories = categories
        self.imageURL = imageURL
        self.isliked = isliked
        
    }
    
    
  
}

extension ArticleModel : Hashable {

    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)

    }
    static func == (lhs: ArticleModel, rhs: ArticleModel) -> Bool {
        return lhs.id == rhs.id
    }
//    
//    func hash(into hasher: inout Hasher) {
//           hasher.combine(id)
//        hasher.combine(title.rendered)
//       }
    
    
}
// MARK: - Content
struct Content: Codable, CleanText {
    
    var rendered: String?
    let protected: Bool
    
    mutating func replaceCodes() {
        var newContent = self.rendered!
        
        newContent = newContent.replacingOccurrences(of: "&#8230;", with: "...")
        newContent = newContent.replacingOccurrences(of: "&#8217;", with: "'")
        newContent = newContent.replacingOccurrences(of: "&#8220;", with: "'")
        newContent = newContent.replacingOccurrences(of: "&#8216;", with: "\'")
        newContent = newContent.replacingOccurrences(of: "&#8221", with: "\'")
        newContent = newContent.replacingOccurrences(of: "&#8211;", with: "-")
        newContent = newContent.replacingOccurrences(of: "&#038;", with: "&")
        newContent = newContent.replacingOccurrences(of: "&nbsp;", with: "\n")
        newContent = newContent.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        
        self.rendered = newContent
    }
    
    
    
}

// MARK: - Title
struct Title: Codable, CleanText {
    mutating func replaceCodes() {
        var newContent = self.rendered!
        
        newContent = newContent.replacingOccurrences(of: "&#8230;", with: "...")
        newContent = newContent.replacingOccurrences(of: "&#8217;", with: "'")
        newContent = newContent.replacingOccurrences(of: "&#8216;", with: "\'")
        newContent = newContent.replacingOccurrences(of: "&#8221", with: "\'")
        newContent = newContent.replacingOccurrences(of: "&#038;", with: "&")
        newContent = newContent.replacingOccurrences(of: "&#8220;", with: "'")
        newContent = newContent.replacingOccurrences(of: "&#8211;", with: "-")
        
        
        self.rendered = newContent
    }
    
    var rendered: String?
    
}

typealias ArticlesList = [ArticleModel]

