//
//  ListInteractor.swift
//  teladocApp
//
//  Created by Alex Apostol on 4/4/22.
//  
//

import Foundation

class ListInteractor: ListInteractorProtocol {
    
    private var dataManager: ListDataManagerProtocol

    init(dataManager: ListDataManagerProtocol) {
        self.dataManager = dataManager
    }
    
    func getDestinations(completion: @escaping (Result<Destinations, APIError>) -> Void) {
        dataManager.getDestinations { result in
            switch result {
            case .success(let destinations):
                completion(.success(destinations))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
