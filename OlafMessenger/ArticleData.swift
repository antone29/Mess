//
//  ArticleData.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/10/24.
//

import Foundation
import UIKit
//import RealmSwift


protocol ArticleDataDelegate : AnyObject {
    func reloadViews()
    
}


class ArticleData {
    
    weak var articleDataDelegate: ArticleDataDelegate?
    var list: [ArticleModel] = []
    var id = 0
    var screenName = "temp"
    func getArticleData(page: Int) {
        
        //here youre only getting what you ask for, so you can just get the category you want, which means you should be able to pass in the category you want and jsut get that data and add it all to one group of articles
        Service().getDataFromServer(page: page,category: id) { data in
            if let data = data {
                if let articleData = self.dataToJSON(data: data) as? [Any] {
                    for article in articleData {
                        if let photoData = article as? [String:Any] {
                            let newArticle = ArticleModel(json: photoData)
                            self.list.append(newArticle)
                         
                        }
                    }
                }
            }
            
            self.articleDataDelegate?.reloadViews()
        }
        
    }
    
    func dataToJSON(data: Data) -> Any? {
        do {
            return try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        } catch let myJSONError {
            print(myJSONError)
        }
        return nil
    }
    
}
