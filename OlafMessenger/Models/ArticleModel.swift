//
//  ArticleModel.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/16/24.
//

import Foundation


protocol CleanText {
    var rendered: String? { get }
    mutating func replaceCodes ()
}

// MARK: - ArticleModel
class ArticleModel: Codable, ObservableObject, Identifiable {
    let date: String?
    var title: Title2
    var content: Content2
    let author: Int?
    let categories: [Int]
    let imageURL: String?
    @Published var isliked = false
    
    enum CodingKeys: String, CodingKey {
        case date, title, content, author, categories
        case imageURL = "jetpack_featured_media_url"
    }
}

// MARK: - Content
struct Content2: Codable, CleanText {
    
    var rendered: String?
    let protected: Bool
    
    mutating func replaceCodes() {
        var newContent = self.rendered!.replacingOccurrences(of: "&#8230;", with: "...")
        newContent = newContent.replacingOccurrences(of: "&#8217;", with: "'")
        newContent = newContent.replacingOccurrences(of: "&#8220;", with: "'")
        newContent = newContent.replacingOccurrences(of: "&#8216;", with: "\'")
        newContent = newContent.replacingOccurrences(of: "&#8221", with: "\'")
        newContent = newContent.replacingOccurrences(of: "&#038;", with: "&")
        newContent = newContent.replacingOccurrences(of: "&nbsp;", with: "\n")
        newContent = newContent.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        self.rendered = newContent
    }
    
    
   
}

// MARK: - Title
struct Title2: Codable, CleanText {
    var rendered: String?
    mutating func replaceCodes() {
        var newContent = self.rendered!.replacingOccurrences(of: "&#8230;", with: "...")
        newContent = newContent.replacingOccurrences(of: "&#8217;", with: "'")
        newContent = newContent.replacingOccurrences(of: "&#8216;", with: "\'")
        newContent = newContent.replacingOccurrences(of: "&#8221", with: "\'")
        newContent = newContent.replacingOccurrences(of: "&#038;", with: "&")
        newContent = newContent.replacingOccurrences(of: "&#8220;", with: "'")
        self.rendered = newContent
    }
}

typealias ArticlesList = [ArticleModel]
