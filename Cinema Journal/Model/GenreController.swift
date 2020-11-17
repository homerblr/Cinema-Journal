//
//  Genres.swift
//  Cinema Journal
//
//  Created by Homer on 11/3/20.
//

import Foundation

final class GenreController {
    static let shared = GenreController()
    var genres: [Genre] = []
    
    func fetchGenres(completionHandler : @escaping (Bool) -> Void) {
        Networking.fetchData(MovieAPITarget.genres, GenreResponse.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let genreData):
                self.genres = genreData.genres
                completionHandler(true)
                
            case .failure(let err):
                completionHandler(false)
                print(err)
            }
        }
    }
    
    func getGenreByIDs(_ ids: [Int]) -> [Genre] {
        guard !genres.isEmpty else { return []}
        let newGenres = genres.filter { (genre) -> Bool in
            ids.contains(genre.id)
        }
        return newGenres
    }
    
    private init() {}
}


struct GenreResponse: Codable {
    let genres: [Genre]
}

struct Genre: Codable {
    let id: Int
    let name: String
}


