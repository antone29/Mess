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
   // let dataCache = NSCache<NSString, AnyObject>()
    
    //This gets the actual JSON from the Olaf Messenger website. I am able to this because the website is created through WordPress, which makes the JSON freely accesible.
    func getDataFromServer(page: Int, category: Int, completion: @escaping (Data?) -> ()) {
        
        let base = "https://www.theolafmessenger.com/wp-json/wp/v2/posts?per_page=10&page="
        let page = String(page)
        let other = "&_fields=title,categories,rendered,author,jetpack_featured_media_url,content,publishedAt,date&orderby=date&categories="
        let section = String(category)
        let url = URL(string: base + page + other + section)!
        
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            if error == nil {
                do {
                
                   // if let articleData = self.dataToJSON(data: data!) {
                        let result = try JSONDecoder().decode(ArticlesList.self, from: data!)
                    for each in result {
                        print("beep bepp")
                        print (each.title)
                    }
                     //   print(result)
                  //  }

                    
                } catch {
                    print(error)
                }
               
            } else {
                print("Error Loading the data")
//                if let data = data {
//                    completion(data)
//                    print(data)
//                }
            }
        }
        
        dataTask.resume()
    }
}

//MARK: - uses lazy loading to get images
extension UIImageView {
    
    // MARK: - Constants
    
    private static let imageCache = NSCache<NSString, AnyObject>()
    
    // MARK: - Properties
    
    //Lazy loading for image from URL
    func setImageFromUrl(imageURL :String) {
        //If an image has already been cached for the article
        if let cachedImage = UIImageView.imageCache.object(forKey: imageURL as NSString) as? UIImage {
            self.image = cachedImage
        }
        else {
//            if (imageURL == nil) {
//                imageURL =
//            }
            URLSession.shared.dataTask( with: URL(string: imageURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!, completionHandler: {
                (data, response, error) -> Void in
                DispatchQueue.main.async {
                    if let data = data {
                        
                        let imageToCache = UIImage(data: data)
                        UIImageView.imageCache.setObject(imageToCache!, forKey: imageURL as NSString)
                        self.image = UIImage(data: data)
                    }
                }
            }).resume()
            
        }
        
    }
    
}
