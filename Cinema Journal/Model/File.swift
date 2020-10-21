//
//  File.swift
//  Cinema Journal
//
//  Created by Homer on 10/21/20.
//

import Foundation


let searchTerm = "obi wan kenobi"
let format = "wookiee"

var urlComponents = URLComponents()
urlComponents.scheme = "https"
urlComponents.host = "swapi.co"
urlComponents.path = "/api/people"
urlComponents.queryItems = [
   URLQueryItem(name: "search", value: searchTerm),
   URLQueryItem(name: "format", value: format)
]

print(urlComponents.url?.absoluteString)
