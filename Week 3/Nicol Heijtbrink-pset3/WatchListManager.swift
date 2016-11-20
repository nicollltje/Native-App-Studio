//
//  WatchListManager.swift
//  Nicol Heijtbrink-pset3
//
//  Created by Nicol Heijtbrink on 18/11/2016.
//  Copyright © 2016 Nicol Heijtbrink. All rights reserved.
//

import Foundation

class WatchListManager{
    
    
    static let WATCH_LIST = "watchlist"
    
    static func getWatchList() -> [String]{
        var watchList = UserDefaults.standard.object(forKey: WATCH_LIST) as? [String]
        if(watchList == nil){
            watchList = []
        }
        return watchList!
    }
    
    static private func setWatchList(watchlist: [String]){
        UserDefaults.standard.set(watchlist, forKey: WATCH_LIST)
    }
    
    static func isInWatchList(imdbId: String) -> Bool{
        return getWatchList().contains(imdbId)
    }
    
    static func addToWatchList(imdbId: String){
        if(isInWatchList(imdbId: imdbId)){
            print("Item already in watchlist")
        } else{
            var myWatchList = getWatchList()
            myWatchList.append(imdbId)
            setWatchList(watchlist: myWatchList)
        }
    }
    
    static func removeFromWatchList(imdbId: String){
        let watchList = getWatchList()
        let newWatchList = watchList.filter { (watchlistitem) -> Bool in
            if(watchlistitem == imdbId){
                return false
            }
            return true
        }
        setWatchList(watchlist: newWatchList)
    }
}
