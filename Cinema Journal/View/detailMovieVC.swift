//
//  detailMovieVC.swift
//  Cinema Journal
//
//  Created by Homer on 11/10/20.
//

import UIKit

class detailMovieVC: UIViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        navigationItem.title = movieTitle.text
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
