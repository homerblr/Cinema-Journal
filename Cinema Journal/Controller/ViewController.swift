//
//  ViewController.swift
//  Cinema Journal
//
//  Created by Homer on 10/21/20.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        Networking.fetchData(MovieAPITarget.movies, MainData.self) { (result) in
            switch result {
            case .success(let movieData):
                print(movieData.results)
            case .failure(let err) :
                print(err)
                
            }
        }
        
    }
    //        Networking.fetchData(TVShowsAPI.discover, TVShowsResponse.self)
}


