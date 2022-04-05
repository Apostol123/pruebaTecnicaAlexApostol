//
//  DestinationDetailInteractor.swift
//  teladocApp
//
//  Created by Alex Apostol on 5/4/22.
//  
//

import Foundation

class DestinationDetailInteractor: DestinationDetailInteractorProtocol {
    
    var dataManager: DestinationDetailDataManagerProtocol

    init(dataManager: DestinationDetailDataManagerProtocol) {
        self.dataManager = dataManager
    }
}
