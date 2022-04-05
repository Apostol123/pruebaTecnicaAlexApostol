//
//  DestinationDetailPresenter.swift
//  teladocApp
//
//  Created by Alex Apostol on 5/4/22.
//  
//

import Foundation

class DestinationDetailPresenter {
    private var interactor: DestinationDetailInteractorProtocol
    weak var view: DestinationDetailViewProtocol?
    private var coordinatorOutput: (DestinationDetailOutput) -> Void
    private var destinationResult: DestinationsResult

    init(destinationResult: DestinationsResult, interactor: DestinationDetailInteractorProtocol, coordinnatorOutput: @escaping (DestinationDetailOutput) -> Void) {
        self.destinationResult = destinationResult
        self.interactor = interactor
        self.coordinatorOutput = coordinnatorOutput
    }
}

extension DestinationDetailPresenter: DestinationDetailPresenterProtocol {
    var destinationData: DestinationsResult {
        return destinationResult
    }
    
    
}
