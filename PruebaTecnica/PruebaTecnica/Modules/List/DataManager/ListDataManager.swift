//
//  ListDataManager.swift
//  teladocApp
//
//  Created by Alex Apostol on 4/4/22.
//  
//

import Foundation

class ListDataManager: ListDataManagerProtocol {
    private let serviceProxy = ServiceProxy()
    
    func getDestinations(completion: @escaping (Result<Destinations, APIError>) -> Void) {
        serviceProxy.getItem(url: Endpoint.mainUrl.rawValue, type: Destinations.self) { result in
            switch result {
            case .success(let destinations):
                completion(.success(destinations))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
