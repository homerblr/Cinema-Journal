//
//  Networking.swift
//  Cinema Journal
//
//  Created by Homer on 10/21/20.
//

import Foundation

struct Networking {
    
    static func fetchData() {
        //Create composed URL
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.themoviedb.org"
        urlComponents.path = "/3/discover/movie"
        urlComponents.queryItems = [
            URLQueryItem(name: "api_key", value: Constants.API.APIkey)
        ]
        guard let url = URL(string: urlComponents.url!.absoluteString) else { return }
        
        //Networking
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data, let response = response else {return}
            do {
                let jsonData = try JSONDecoder().decode(MainData.self, from: data)
                print(jsonData.results[5].title)
            } catch {
                print(error)
            }
//            print(response)
            if let e = error {
                print(e)
            }
        }
        .resume()
    }
}


