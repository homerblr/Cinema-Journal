//
//  Networking.swift
//  Cinema Journal
//
//  Created by Homer on 10/21/20.
//

import Foundation

struct Networking {


//
//    let searchTerm = "obi wan kenobi"
//    let format = "wookiee"
//
//    func some() {
//
//        var urlComponents = URLComponents()
//        urlComponents.scheme = "https"
//        urlComponents.host = "swapi.co"
//        urlComponents.path = "/api/people"
//        urlComponents.queryItems = [
//           URLQueryItem(name: "search", value: searchTerm),
//           URLQueryItem(name: "format", value: format)
//        ]
//
//        print(urlComponents.url?.absoluteString)
//    }
//
//
    var url = "https://api.themoviedb.org/3/movie/400?api_key=6b362d8d2ac29e77bb52923cde8741e1"
    
    
    
    func performRequest() {
        if let url = URL(string: url) {
            let session = URLSession.shared
            session.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    let stringData = String(data: data, encoding: .utf8)
                    print(stringData)
                }
                if let error = error {
                    print(error)
                }
               
            }.resume()
        }
        
        
    }
}


//let searchTerm = "obi wan kenobi"
//let format = "wookiee"
//
//var urlComponents = URLComponents()
//urlComponents.scheme = "https"
//urlComponents.host = "swapi.co"
//urlComponents.path = "/api/people"
//urlComponents.queryItems = [
//   URLQueryItem(name: "search", value: searchTerm),
//   URLQueryItem(name: "format", value: format)
//]
//
//print(urlComponents.url?.absoluteString)
