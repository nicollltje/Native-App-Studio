//
//  MovieTableViewCell.swift
//  Nicol Heijtbrink-pset3
//
//  Created by Nicol Heijtbrink on 17/11/2016.
//  Copyright © 2016 Nicol Heijtbrink. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    var movie : Movie?{
        didSet{
            layout()
        }
    }
    
    var movieId : String?{
        didSet{
            MovieAPI.getMovie(imdbId: movieId!){ movieResult in
                DispatchQueue.main.async{
                    self.movie = movieResult
                }
            }
        }
    }
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func layout(){
        posterImageView.image = UIImage(named: "poster_blank")
        nameLabel.text = movie!.title
        yearLabel.text = movie!.year
        movie?.getPoster(){ image in
            DispatchQueue.main.async(){
                self.posterImageView.image = image
            }
        }
    }
    
}
