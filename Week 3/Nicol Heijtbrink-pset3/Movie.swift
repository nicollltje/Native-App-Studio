//
//  Movie.swift
//  Nicol Heijtbrink-pset3
//
//  Created by Nicol Heijtbrink on 17/11/16.
//  Copyright © 2016 Nicol Heijtbrink. All rights reserved.
//

import Foundation
import UIKit

class Movie : NSObject{
    var actors : String?
    var title : String?
    var year : String?
    var posterUrl : String?
    var plot : String?
    var image : UIImage?
    var imdbID : String?
    
    init(json: [String : Any]){
        self.actors = json["Actors"] as? String
        self.title = json["Title"] as? String
        self.year = json["Year"] as? String
        self.posterUrl = json["Poster"] as? String
        self.imdbID = json["imdbID"] as? String
        self.plot = json["Plot"] as? String
    }
    
    func getPoster(callback: @escaping (UIImage)->()){
        if let urlString = self.posterUrl{
            getDataFromUrl(url: URL(string: urlString)!){ (imageData, response, error) in
                if(imageData != nil){
                    if let image = UIImage(data: imageData!){
                        self.image = image
                        callback(image)
                    }
                }
            }
        }
    }
    
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
}


