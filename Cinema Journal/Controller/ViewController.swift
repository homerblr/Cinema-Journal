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
        Networking.fetchData(MovieAPITarget.movies, MainData.self)
        Networking.fetchData(TVShowsAPI.discover, TVShowsResponse.self)
    }
}

