//
//  Networking.swift
//  Cinema Journal
//
//  Created by Homer on 10/21/20.
//

import Foundation

struct Networking {
    
    static func fetchData<T>(_ request : APITarget, _ modelType : T.Type, completionHandler : @escaping (T?, Error?) -> Void) where T: Codable {
        //Create composed URL
        var urlComponents = URLComponents()
        urlComponents.scheme = request.scheme
        urlComponents.host = request.host
        urlComponents.path = request.path
        urlComponents.queryItems = request.queryItems
        
        guard let stringURL = urlComponents.url?.absoluteString,
              let url = URL(string: stringURL) else { return }
        
        //Networking
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data, let response = response else { return }
            do {
                let jsonData = try JSONDecoder().decode(T.self, from: data)
                completionHandler(jsonData, nil)
            } catch {
                completionHandler(nil, error)
            }
            if let e = error {
                print(e)
            }
        }.resume()
    }
}


