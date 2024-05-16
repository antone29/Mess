//
//  WelcomeElement.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/16/24.
//

import Foundation

// MARK: - WelcomeElement
class ArticleModel: Codable, ObservableObject, Identifiable {
    let date: String?
    let title: Title2
    let content: Content2
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
struct Content2: Codable {
    let rendered: String?
    let protected: Bool
}

// MARK: - Title
struct Title2: Codable {
    let rendered: String?
}

typealias ArticlesList = [ArticleModel]
