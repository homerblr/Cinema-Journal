//
//  MovieCellTableViewCell.swift
//  Cinema Journal
//
//  Created by Homer on 10/27/20.
//

import UIKit
import Kingfisher

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
            movieRate.text = NSLocalizedString("no_ratings", comment: "")
        } else {
            movieRate.text = numberFormat(model.voteAverage)
        }
        posterImage.kf.setImage(with: URL(string: Constants.API.posterURL + model.posterPath))
  
        let genres = GenreController.shared.getGenreByIDs(model.genreIDS).map({
            $0.name
        })
        
        let genreString = genres.joined(separator: " | ")
        yearAndGenre.text = (dateFormat(model.releaseDate) ?? "nil") + " | " + genreString
        
    }
    
    
    func numberFormat (_ num : Double) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        guard let stringNum = formatter.string(for: num) else {return nil}
        return stringNum
    }
    
    func dateFormat(_ date: String) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let actualDate = formatter.date(from: date) else {return nil}
        let newFormatter = DateFormatter()
        newFormatter.dateStyle = .medium
        newFormatter.timeStyle = .none
        let stringDate = newFormatter.string(from: actualDate)
        return stringDate
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
}


