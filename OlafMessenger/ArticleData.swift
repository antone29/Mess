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

@MainActor
class ArticleData : ObservableObject{
    
    weak var articleDataDelegate: ArticleDataDelegate?
    //create an empty list to put your sorted articles in
    @Published var list: [ArticleModel] = []

    func getArticleData(page: Int, category: Int) async {
        
        //keep in mind that this only returns one category of data(which you pass in which one you want with the id)
        Service().getDataFromServer(page: page, category: category) { data in
            if let data = data {
                //this line gets all of the articles in JSON format and puts them into articleData
                if let articleData = self.dataToJSON(data: data) as? [Any] {
                    //this line creates a loop and does the action inside the loop for every article in article data
                    for article in articleData {
                        //this creates a constant with the article as a [String:Any] which is a dictionary, so its still a jumble of JSON that is difficult for us to use
                        if let photoData = article as? [String:Any] {
                            //creates a constant as type ArticleModel and sorts through the JSON to create an constant that is easier for us to use
                            let newArticle = ArticleModel(json: photoData)
                            //add each new ArticleModell to our list so we can use it elsewhere
                            DispatchQueue.main.async {
                                self.list.append(newArticle)
                            }
                            
                            
                         
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
