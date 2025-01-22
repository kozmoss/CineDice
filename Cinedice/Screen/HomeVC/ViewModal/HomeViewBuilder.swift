//
//  HomeViewBuilder.swift
//  Netflix
//
//  Created by samet on 30.11.2024.
//
import Foundation

 class MovieListBuilder {
    static func make() -> HomeViewController {
        let vc = HomeViewController()
        let viewModal = HomeViewModal(service: NetworkCaller())
        vc.viewModal = viewModal
        return vc
    }
}
