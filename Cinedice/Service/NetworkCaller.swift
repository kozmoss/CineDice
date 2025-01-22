//
//  NetworkCaller.swift
//  Netflix
//
//  Created by samet on 29.11.2024.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchData<T:Decodable>(_ endpoint: EndPoint, completion: @escaping(Result<T,Error>) -> Void )
}

final class NetworkCaller: NetworkServiceProtocol {
    func fetchData<T:Decodable>(_ endpoint: EndPoint, completion: @escaping(Result<T,Error>) -> Void ) {
        
        let task = URLSession.shared.dataTask(with: endpoint.request()) { data, response , error in
            
            if let error = error {
                completion(.failure(error))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode >= 200, response.statusCode <= 299 else {
                return
            }
            
            guard let data = data else {
                completion(.failure(URLError(.badURL)))
                return
            }
            
            do {
                let decodeData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodeData))
            } catch let error{
                print(error)
            }
        }
        task.resume()
        
    }
}
