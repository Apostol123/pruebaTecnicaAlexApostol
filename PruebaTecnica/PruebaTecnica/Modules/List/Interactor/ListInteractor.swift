//
//  ListInteractor.swift
//  teladocApp
//
//  Created by Alex Apostol on 4/4/22.
//  
//

import Foundation

class ListInteractor: ListInteractorProtocol {
    
    var dataManager: ListDataManagerProtocol

    init(dataManager: ListDataManagerProtocol) {
        self.dataManager = dataManager
    }
}
