//
//  ArticleModel.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/10/24.
//

import Foundation

struct Title: Codable {
    let title: String?
    init(json: [String:Any]){
        self.title = json["rendered"] as? String
    }
}

struct Content: Codable {
    let content: String?
    init(json: [String: Any]) {
        self.content = json["rendered"] as? String
    }
}

//you will see many replacement lines. The original JSON had a lot of html tags and special characters were replaced with the lines you see below. This was the neatest, shorter way I was able to clean up the content and titles.
//Author is not used because the authors are passed as interger values, not named. I do not have access to the API that maps the numbers to the names unfortunately.
class ArticleModel: Codable {
    let date: String?
    let title: String?
    let content: String?
    let author: Int?
    let categories: [Int]?
    let url: String?
    
    init(json: [String:Any]) {
        self.date = json["date"] as? String
        self.author = json["author"] as? Int
        self.categories = json["categories"] as? [Int]
        self.url = json["jetpack_featured_media_url"] as? String
        
        if let titleDict = json["title"] as? [String: Any] {
            let temp = Title(json: titleDict)
            var temp2 = temp.title!.replacingOccurrences(of: "&#8230;", with: "...")
            temp2 = temp2.replacingOccurrences(of: "&#8217;", with: "'")
            temp2 = temp2.replacingOccurrences(of: "&#8216;", with: "\'")
            temp2 = temp2.replacingOccurrences(of: "&#8221", with: "\'")
            temp2 = temp2.replacingOccurrences(of: "&#038;", with: "&")
            temp2 = temp2.replacingOccurrences(of: "&#8220;", with: "'")
            self.title = temp2
        } else {
            self.title = json["title"] as? String
        }
        
        if let contentDict = json["content"] as? [String: Any] {
            let temp = Content(json: contentDict)
            var temp2 = temp.content!.replacingOccurrences(of: "&#8230;", with: "...")
            temp2 = temp2.replacingOccurrences(of: "&#8217;", with: "'")
            temp2 = temp2.replacingOccurrences(of: "&#8216;", with: "\'")
            temp2 = temp2.replacingOccurrences(of: "&#8221", with: "\'")
            temp2 = temp2.replacingOccurrences(of: "&#038;", with: "&")
            temp2 = temp2.replacingOccurrences(of: "&nbsp;", with: "\n")
            temp2 = temp2.replacingOccurrences(of: "&#8220;", with: "'")
            temp2 = temp2.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
            
            
            self.content = temp2
        } else {
            self.content = json["content"] as? String
        }
    }
    
    
}



