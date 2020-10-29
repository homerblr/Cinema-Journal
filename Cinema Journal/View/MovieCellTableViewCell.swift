//
//  MovieCellTableViewCell.swift
//  Cinema Journal
//
//  Created by Homer on 10/27/20.
//

import UIKit

class MovieCellTableViewCell: UITableViewCell {
    
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var yearAndGenre: UILabel!
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var movieDescription: UILabel!
    @IBOutlet var movieRate: UILabel!
    @IBOutlet var starImageView: UIImageView!
    
    static let cellIdentifier = "movieCell"
    static let nibName = "MovieCellTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        posterImage.layer.cornerRadius = 6
        posterImage.layer.masksToBounds = true
        
        
    }
    
    func configureCell (_ model: MovieDetails) {
        movieTitle.text = model.title
        movieDescription.text = model.overview
        if model.voteAverage <= 0.0 {
            movieRate.text = "No ratings yet"
        } else {
            movieRate.text = numberFormat(model.voteAverage)
        }
        let year = model.releaseDate.dropLast(6)
        yearAndGenre.text = String(year) // need to add genre in a single string
    }
    
    func numberFormat (_ num : Double) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        guard let stringNum = formatter.string(for: num) else {return nil}
        return stringNum
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
