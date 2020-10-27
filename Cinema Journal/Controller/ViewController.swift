//
//  ViewController.swift
//  Cinema Journal
//
//  Created by Homer on 10/21/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: MovieCellTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: MovieCellTableViewCell.cellIdentifier)
        
        Networking.fetchData(MovieAPITarget.movies, MainData.self) { (result) in
            switch result {
            case .success(let movieData):
                print(movieData.results)
            case .failure(let err) :
                print(err)
            }
        }
    }
   
    
}


extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieCellTableViewCell.cellIdentifier, for: indexPath) as! MovieCellTableViewCell
        return cell
    }
    
    
}





