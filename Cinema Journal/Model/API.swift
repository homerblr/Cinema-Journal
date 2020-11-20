//
//  API.swift
//  Cinema Journal
//
//  Created by Homer on 10/22/20.
//

import Foundation

protocol APITarget {
    var path: String { get }
    var method: Method { get }
    var host : String { get }
    var queryItems : [URLQueryItem]? { get }
    var scheme : String? { get }
}

extension APITarget {
    var host : String {
        return "api.themoviedb.org"
    }
    var queryItems : [URLQueryItem]? {
        return [URLQueryItem(name: "api_key", value: Constants.API.APIkey)]
    }
    var scheme : String? {
        return "https"
    }
}

enum MovieAPITarget {
    case movies(isAdult: Bool)
    case genres
    
}

enum TVShowsAPI {
    case discover
}


extension TVShowsAPI: APITarget {
    var path: String {
        switch self {
        case .discover: return "/3/discover/tv"
        }
    }
    var method: Method {
        switch self {
        case .discover: return .get
        }
    }
}

extension MovieAPITarget: APITarget {
    var path: String {
        switch self {
        case .movies: return "/3/discover/movie"
        case .genres: return "/3/genre/movie/list"
        }
    }
    
    var method: Method {
        switch self {
        case .movies: return .get
        case .genres: return .get
        }
    }
    
    var queryItems : [URLQueryItem]? {
        var queryItem : [URLQueryItem] = [URLQueryItem(name: "api_key", value: Constants.API.APIkey)]
        switch self {
        case .movies(let isAdult): queryItem.append(URLQueryItem(name: "include_adult", value: String(isAdult)))
        case .genres: break
        }
        return queryItem
    }
}



enum Method: String {
    case get
    case post
}
