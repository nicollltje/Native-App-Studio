//
//  DetailViewController.swift
//  Nicol Heijtbrink-pset3
//
//  Created by Nicol Heijtbrink on 14/11/16.
//  Copyright © 2016 Nicol Heijtbrink. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var movie : Movie?
    var movieId : String?
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var actorsLabel: UILabel!
    @IBOutlet weak var plotTextView: UITextView!
    @IBOutlet weak var watchListButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = ""
        yearLabel.text = ""
        actorsLabel.text = ""
        plotTextView.text = ""
        
        if(movie != nil){
            MovieAPI.getMovie(imdbId: movie!.imdbID){ movieResult in
                DispatchQueue.main.async(){
                    self.movie = movieResult
                    self.layout()
                }
            }
        }
        
        if(movieId != nil){
            MovieAPI.getMovie(imdbId: movieId!){ movieResult in
                DispatchQueue.main.async(){
                    self.movie = movieResult
                    self.layout()
                }
            }
        }
        updateWatchListButton()
    }
    
    func layout(){
        updateWatchListButton()
        plotTextView.text = movie?.plot
        actorsLabel.text = movie?.actors
        nameLabel.text = movie?.title
        yearLabel.text = movie?.year
        if(movie!.image != nil && posterImageView != nil){
            posterImageView.image = movie?.image
        } else{
            movie?.getPoster(){ image in
                DispatchQueue.main.async {
                    self.posterImageView.image = self.movie?.image
                }
            }
        }
    }

    @IBAction func watchListButtonPressed(_ sender: UIBarButtonItem) {
        if let movieId = movie?.imdbID{
            if(WatchListManager.isInWatchList(imdbId: movieId)){
                WatchListManager.removeFromWatchList(imdbId: movieId)
            } else{
                WatchListManager.addToWatchList(imdbId: movieId)
            }
            updateWatchListButton()
        }
    }
    
    func updateWatchListButton(){
        if let movieId = movie?.imdbID{
            if(WatchListManager.isInWatchList(imdbId: movieId)){
                watchListButton.title = "(-)"
            } else{
                watchListButton.title = "(+)"
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
