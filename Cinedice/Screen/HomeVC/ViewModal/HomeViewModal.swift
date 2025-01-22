//
//  HomeViewModal.swift
//  Netflix
//
//  Created by samet on 30.11.2024.
//

import Foundation

final class HomeViewModal: MovieListViewModalProtocol {
    var delegate: MovieListViewModalDelegate?
    var service:NetworkServiceProtocol
    
    init( service: NetworkServiceProtocol) {
        self.service = service
    }
    
    func load() {
        service.fetchData(.popular) { (result: Result<Movie, Error>) in
            switch result {
            case .success(let movie):
                self.delegate?.handleOutput(.popular(movie.results ?? []))
            case .failure(let error):
                self.delegate?.handleOutput(.error(error))
            }
        }
    }
    
    
}
