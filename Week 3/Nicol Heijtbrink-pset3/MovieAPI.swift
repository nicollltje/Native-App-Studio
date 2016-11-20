//
//  MovieAPI.swift
//  Nicol Heijtbrink-pset3
//
//  Created by Nicol Heijtbrink on 17/11/16.
//  Copyright © 2016 Nicol Heijtbrink. All rights reserved.
//

import Foundation

class MovieAPI{
    
    static private let API_KEY      = "6b6604ac"
    static private let BASE_URL     = "https://www.omdbapi.com/?"
    static private let SEARCH_URL     = "https://www.omdbapi.com/?s="
    static private let URL_APPENDIX = "&plot=full&type=movie"
    
    static func getMovie(title: String? = nil, imdbId : String? = nil, callback : @escaping (Movie)->()){
        var urlString = BASE_URL
        if(title != nil){
            urlString += "t=\(title!)"
        }
        
        if(imdbId != nil){
            urlString += "i=\(imdbId!)"
        }
        
        urlString = ((urlString + URL_APPENDIX).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed))!
        
        let request = URLRequest(url: URL(string: urlString)!)
        
        MovieAPI.httpGet(request: request){
            (data, error) -> Void in
            if error != nil {
                print("\(error)")
            } else {
                let movie = Movie(json: (data as! [String : String]))
                callback(movie)
            }
        }
    }
    
    static func searchMovies(title: String = "", callback : @escaping ([Movie])->()){
        let urlString = (SEARCH_URL + title + URL_APPENDIX).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let request = URLRequest(url: URL(string: urlString!)!)
        
        MovieAPI.httpGet(request: request){ (data, error) in
            if error != nil {
                print("\(error)")
            } else {
                if let movieData = (data["Search"] as? [[String : Any]])
                {
                    let movies = movieData.map{ movie in
                        return Movie(json: movie)
                    }
                    callback(movies)
                }
            }
        }
    }
    
    static func httpGet(request: URLRequest!, callback: @escaping ([String : Any], String?) -> Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: request){ (data, response, error) in
            if error != nil {
                callback([:], error?.localizedDescription)
            } else {
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String : Any]
                    callback(json, nil)
                }catch {
                    //todo : callback error?
                    print("Error with Json: \(error)")
                }
            }
        }
        task.resume()
    }
    
}
