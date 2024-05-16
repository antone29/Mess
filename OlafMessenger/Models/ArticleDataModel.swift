//
//  ArticleData.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/10/24.
//

import Foundation
import UIKit

@MainActor
class ArticleDataModel : ObservableObject {

    //create an empty list to put your sorted articles in
    @Published var list: [ArticleModel] = []

    func getArticleData(page: Int, category: Int) async {
        
        //keep in mind that this only returns one category of data(which you pass in which one you want with the id)
        Service().getDataFromServer(page: page, category: category) { data in
 
                if let data = data {
                    for each in data {
                      
                        DispatchQueue.main.async {
                            self.list.append(each)
                        }
                
                }
            }
        }
        
    }
    
    
}
