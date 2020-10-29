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
                self.results.append(contentsOf: movieData.results)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let err) :
                print(err)
            }
        }
    }

}

//-MARK: TableView extensions
extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCellTableViewCell.cellIdentifier, for: indexPath) as! MovieCellTableViewCell
        cell.configureCell(results[indexPath.row])
        return cell
    }
    
    
}





