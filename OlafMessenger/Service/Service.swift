//
//  Service.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/10/24.
//

import Foundation
import UIKit


//Troubleshooting: Are you not getting any data at all? copy the base, page, other, and section that you are using. past into a web browser. if nothing comes up its because the page and/or category dont exist. 
class Service {
    let session = URLSession.shared
 
    //This gets the actual JSON from the Olaf Messenger website. I am able to this because the website is created through WordPress, which makes the JSON freely accesible.
    func getDataFromServer(page: Int, category: Int, completion: @escaping ([ArticleModel]?) -> ()) {
        
        let url = getUrl(page: page, category: category)

        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            if error == nil {
                do {
                        let result = try JSONDecoder().decode(ArticlesList.self, from: data!)
                    completion(result)
                    print(result)
                } catch {
                    print(error)
                }
               
            } else {
                print("Error Loading the data")
            }
        }
        
        dataTask.resume()
    }
    
    func getUrl(page: Int, category: Int) -> URL {
        let base = "https://www.theolafmessenger.com/wp-json/wp/v2/posts?per_page=10&page="
        let page = String(page)
        let other = "&_fields=title,categories,rendered,author,jetpack_featured_media_url,content,publishedAt,date&orderby=date&categories="
        let section = String(category)
        return URL(string: base + page + other + section)!
        
      
    }
}

