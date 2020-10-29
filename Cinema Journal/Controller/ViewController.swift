//
//  ViewController.swift
//  Cinema Journal
//
//  Created by Homer on 10/21/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var results : [MovieDetails] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: MovieCellTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: MovieCellTableViewCell.cellIdentifier)
        tableView.estimatedRowHeight = 136
        
        Networking.fetchData(MovieAPITarget.movies, MainData.self) { (result) in
            switch result {
            case .success(let movieData):
                self.results = movieData.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                print(self.results)
            case .failure(let err) :
                print(err)
            }
        }
    }

}

//-MARK: TableView extensions
extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(results.count)
        return results.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCellTableViewCell.cellIdentifier, for: indexPath) as! MovieCellTableViewCell
        cell.movieTitle.text = results[indexPath.row].title
        cell.movieDescription.text = results[indexPath.row].overview
        
        if results[indexPath.row].voteAverage <= 0.0 {
            cell.movieRate.text = "No ratings yet"
        } else {
            cell.movieRate.text = String(format: "%.1f", results[indexPath.row].voteAverage)
        }
        
        let year = results[indexPath.row].releaseDate.dropLast(6)
        cell.yearAndGenre.text = String(year) // need to add genre in a single string
        return cell
    }
    
    
}





