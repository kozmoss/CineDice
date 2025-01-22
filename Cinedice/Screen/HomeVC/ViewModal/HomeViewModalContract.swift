//
//  HomeViewModal.swift
//  Netflix
//
//  Created by samet on 30.11.2024.
//

import Foundation

protocol MovieListViewModalProtocol {
    var delegate:MovieListViewModalDelegate? { get set }
    func load()
}

enum MovieListViewModalOutPut {
    case popular([MovieResult])
    case upComing([MovieResult])
    case topRated([MovieResult])
    case error (Error)
}

protocol MovieListViewModalDelegate {
    func handleOutput(_ output: MovieListViewModalOutPut)
}
