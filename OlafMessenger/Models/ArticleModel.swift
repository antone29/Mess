////
////  ArticleModel.swift
////  OlafMessenger
////
////  Created by Bekki Antonelli on 5/10/24.
////
//
//import Foundation
//
//struct Title: Codable {
//    let rendered: String
//        let protected: Bool
//}
//
//struct Content: Codable {
//    let rendered: String
//        let protected: Bool
//}
//
////you will see many replacement lines. The original JSON had a lot of html tags and special characters were replaced with the lines you see below. This was the neatest, shorter way I was able to clean up the content and titles.
////Author is not used because the authors are passed as interger values, not named. I do not have access to the API that maps the numbers to the names unfortunately.
//
////let data = try? JSONDecoder().decode([ArticleModel].self, from: jsonData)
//
//class ArticleModel: ObservableObject, Codable, Identifiable {
//
//    let date: String?
//    let title: String?
//    let content: String?
//    let author: Int?
//  //  let categories: [Int]?
//    let url: String?
//  //  @Published var isLiked = false
//    
//    enum CodingKeys: CodingKey {
//        case date, title, content, author, url
//    }
//    
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//      //  isLiked = try container.decode(Bool.self, forKey: .isLiked)
//        date = try container.decode(String.self, forKey: .date)
//        title = try container.decode(String.self, forKey: .title)
//        content = try container.decode(String.self, forKey: .content)
//        author = try container.decode(Int.self, forKey: .author)
//        url = try container.decode(String.self, forKey: .url)
//      //  categories = try container.decode([Int].self, forKey: .categories)
//       
//        
//    }
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//       // try container.encode(isLiked, forKey: .isLiked)
//    }
//    
////    init(date: String?, title: String?, content: String?, author: Int?, categories: [Int]?, url: String?) {
////        self.date = date
////        self.title = title
////        self.content = content
////        self.author = author
////        self.categories = categories
////        self.url = url
////    }
//    
////    init(json: [String:Any]) {
////        self.date = json["date"] as? String
////        self.author = json["author"] as? Int
////       // self.categories = json["categories"] as? [Int]
////        self.url = json["jetpack_featured_media_url"] as? String
//        
//        if let titleDict = json["title"] as? [String: Any] {
//            let temp = Title(json: titleDict)
//            var temp2 = temp.title!.replacingOccurrences(of: "&#8230;", with: "...")
//            temp2 = temp2.replacingOccurrences(of: "&#8217;", with: "'")
//            temp2 = temp2.replacingOccurrences(of: "&#8216;", with: "\'")
//            temp2 = temp2.replacingOccurrences(of: "&#8221", with: "\'")
//            temp2 = temp2.replacingOccurrences(of: "&#038;", with: "&")
//            temp2 = temp2.replacingOccurrences(of: "&#8220;", with: "'")
//            self.title = temp2
//        } else {
//            self.title = json["title"] as? String
//        }
//        
//        if let contentDict = json["content"] as? [String: Any] {
//            let temp = Content(json: contentDict)
//            var temp2 = temp.content!.replacingOccurrences(of: "&#8230;", with: "...")
//            temp2 = temp2.replacingOccurrences(of: "&#8217;", with: "'")
//            temp2 = temp2.replacingOccurrences(of: "&#8216;", with: "\'")
//            temp2 = temp2.replacingOccurrences(of: "&#8221", with: "\'")
//            temp2 = temp2.replacingOccurrences(of: "&#038;", with: "&")
//            temp2 = temp2.replacingOccurrences(of: "&nbsp;", with: "\n")
//            temp2 = temp2.replacingOccurrences(of: "&#8220;", with: "'")
//            temp2 = temp2.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
//            
//            
//            self.content = temp2
//        } else {
//            self.content = json["content"] as? String
//        }
//    }
//    
//    
//}
//
//
//
