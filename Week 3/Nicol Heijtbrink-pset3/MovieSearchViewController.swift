//
//  MovieSearchViewController.swift
//  Nicol Heijtbrink-pset3
//
//  Created by Nicol Heijtbrink on 14/11/16.
//  Copyright © 2016 Nicol Heijtbrink. All rights reserved.
//

import UIKit

class MovieSearchViewController: UIViewController, UISearchBarDelegate{
    
    @IBOutlet weak var movieSearchResultTableView: UITableView!
    @IBOutlet weak var movieSearchBar: UISearchBar!

    var movies : [Movie] = []{
        didSet{
            movieSearchResultTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieSearchResultTableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "movieCell")
        movieSearchBar.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        MovieAPI.searchMovies(title: searchBar.text!){ downloadedMovies in
            DispatchQueue.main.async(){
                self.movies = downloadedMovies
                searchBar.resignFirstResponder()
            }
        }
    }
    
}

extension MovieSearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! DetailViewController
        
        let movie = movies[indexPath.row]
        detailViewController.movie = movie
        
        self.navigationController?.pushViewController(detailViewController, animated: true)
        
    }
    
}

extension MovieSearchViewController: UITableViewDataSource {
    func  tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movieCell = self.movieSearchResultTableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieTableViewCell
        movieCell.movie = movies[indexPath.row]
        return movieCell
    }
}
