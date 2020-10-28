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
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
