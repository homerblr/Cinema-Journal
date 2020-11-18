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
    
    let segueID = "goToDetailMovieVC"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: MovieCellTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: MovieCellTableViewCell.cellIdentifier)
        tableView.estimatedRowHeight = 136
        
        
        
        Networking.fetchData(MovieAPITarget.movies, MainData.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let movieData):
                self.results.append(contentsOf: movieData.results)
                GenreController.shared.fetchGenres { (success) in
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        
                    }
                    
                }
            case .failure(let err) :
                DispatchQueue.main.async {
                    self.showAlert()
                    print(err)
                }
            }
        }
    }
    //MARK: - UIAlert
    func showAlert() {
        let ac = UIAlertController(title: NSLocalizedString("network_error_title", comment: ""), message: NSLocalizedString("fetch_failure", comment: ""), preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        ac.addAction(okButton)
        present(ac, animated: true, completion: nil)
    }
}

//-MARK: TableView extensions

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCellTableViewCell.cellIdentifier, for: indexPath) as! MovieCellTableViewCell
        guard indexPath.row < results.count  else { fatalError("cell index out of bounds at movies tableview") }
        cell.configureCell(results[indexPath.row])
        
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: segueID, sender: indexPath)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == segueID {
             guard let destinationVC = segue.destination as? DetailMovieVC else {return}
            let row = (sender as! NSIndexPath).row
            let model = results[row]
            DispatchQueue.main.async {
                destinationVC.configureModel(model)
            }

         }
     }
}








