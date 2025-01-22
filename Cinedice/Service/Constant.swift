//
//  Constant.swift
//  Netflix
//
//  Created by samet on 29.11.2024.
//

import Foundation

protocol EnumProtocol {
    var baseURL:String {get}
    var genreURL:String {get}
    var apiKey: String {get}
}


enum HTTPS_METHOD:String {
    case get = "GET"
    case post = "POST"
}

enum EndPoint {
    case popular
    case topRated
    case upComing
}


extension EndPoint: EnumProtocol {
    var baseURL: String {
        return "https://api.themoviedb.org/3/movie/"
    }
    
    var genreURL: String {
        switch self {
        case .popular:
            return "popular"
        case .topRated:
            return "top_rated"
        case .upComing:
            return "upcoming"
        }
    }
    
    var apiKey: String {
        return "?api_key=318fefbfd1bc2d5e7606fe9f66ddbf06"
    }
    
    var method: HTTPS_METHOD {
        switch self {
        case .popular:
            return .get
        case .upComing:
            return .get
        case .topRated:
            return .get
        }
    }
    
    func movieAPIUrl() -> String {
        return "\(baseURL)\(genreURL)\(apiKey)"
    }
    
    func request() -> URLRequest {
        guard let apiURL = URLComponents(string: movieAPIUrl())  else {
            fatalError("URL Components Olusturalamadı")
        }
        
        guard let url = apiURL.url else {
            fatalError("url olusturalamadı")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        return request
        
        
        
    }
    
    
}
