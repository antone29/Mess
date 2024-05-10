//
//  Service.swift
//  OlafMessenger
//
//  Created by Bekki Antonelli on 5/10/24.
//

import Foundation
import UIKit

class Service {
    let session = URLSession.shared
    let dataCache = NSCache<NSString, AnyObject>()
    
    //This gets the actual JSON from the Olaf Messenger website. I am able to this because the website is created through WordPress, which makes the JSON freely accesible.
    func getDataFromServer(page: Int, category: Int, completion: @escaping (Data?) -> ()) {
        
        let base = "https://www.theolafmessenger.com/wp-json/wp/v2/posts?per_page=10&page="
        let page = String(page)
        let other = "&_fields=title,categories,rendered,author,jetpack_featured_media_url,content,publishedAt,date&orderby=date&categories="
        let section = String(category)
        let url = URL(string: base + page + other + section)!
        
        let dataTask = session.dataTask(with: URLRequest(url: url)) { data, response, error in
            if error != nil {
                print("Error Loading the data")
            } else {
                if let data = data {
                    completion(data)
                }
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
