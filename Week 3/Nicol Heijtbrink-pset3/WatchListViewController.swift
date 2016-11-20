//
//  WatchListViewController.swift
//  Nicol Heijtbrink-pset3
//
//  Created by Nicol Heijtbrink on 14/11/16.
//  Copyright © 2016 Nicol Heijtbrink. All rights reserved.
//

import UIKit

class WatchListViewController: UIViewController {

    @IBOutlet weak var watchListTableView: UITableView!
    
    var watchList : [String] = []{
        didSet{
            watchListTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        watchListTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "movieCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        loadWatchList()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMovieDetail"{
            
        }
    }
    
    func loadWatchList(){
        watchList = WatchListManager.getWatchList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension WatchListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! DetailViewController
        
        let movieId = watchList[indexPath.row]
        detailViewController.movieId = movieId
        
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension WatchListViewController: UITableViewDataSource {
    
    func  tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // returns amount of rows, in this case number of items in watchlist
        return watchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieCell = self.watchListTableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
                
        movieCell.posterImageView.image = UIImage(named: "poster_blank")
        movieCell.movieId = watchList[indexPath.row]
        
       return movieCell

    }
}
