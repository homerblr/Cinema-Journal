//
//  detailMovieVC.swift
//  Cinema Journal
//
//  Created by Homer on 11/10/20.
//

import UIKit
import Kingfisher

class DetailMovieVC: UIViewController {

    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var releaseYear: UILabel!
    @IBOutlet var movieGenre: UILabel!
    @IBOutlet var countryAndLength: UILabel!
    @IBOutlet var starImage: UIImageView!
    @IBOutlet var movieRating: UILabel!
    @IBOutlet var adultNote: UILabel!
    @IBOutlet var movieDescription: UILabel!
    @IBOutlet var scrollView: UIScrollView!
    
    var model: MovieDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        posterImage.layer.cornerRadius = 6
        posterImage.layer.masksToBounds = true
        self.tabBarController?.tabBar.isHidden = true
        if let model = model {
            configureModel(model)
        }
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
       

    }
    
    func configureModel(_ model: MovieDetails) {
        movieTitle.text = model.title
        navigationItem.title = model.title
        movieDescription.text = model.overview
        if model.voteAverage <= 0.0 {
            movieRating.text = NSLocalizedString("no_ratings", comment: "")
        } else {
            movieRating.text = numberFormat(model.voteAverage)
        }
        posterImage.kf.setImage(with: URL(string: Constants.API.posterURL + model.posterPath))
  
        let genres = GenreController.shared.getGenreByIDs(model.genreIDS).map({
            $0.name
        })
        let genreString = genres.joined(separator: " | ")
        movieGenre.text = genreString
        releaseYear.text = (dateFormat(model.releaseDate) ?? "nil")
        
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

}
