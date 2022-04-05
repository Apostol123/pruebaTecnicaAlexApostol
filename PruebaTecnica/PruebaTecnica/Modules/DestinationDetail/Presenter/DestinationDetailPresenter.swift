//
//  DestinationDetailPresenter.swift
//  teladocApp
//
//  Created by Alex Apostol on 5/4/22.
//  
//

import Foundation

class DestinationDetailPresenter {
    var interactor: DestinationDetailInteractorProtocol
    weak var view: DestinationDetailViewProtocol?
    var coordinatorOutput: (DestinationDetailOutput) -> Void

    init(interactor: DestinationDetailInteractorProtocol, coordinnatorOutput: @escaping (DestinationDetailOutput) -> Void) {
        self.interactor = interactor
        self.coordinatorOutput = coordinnatorOutput
    }
}

extension DestinationDetailPresenter: DestinationDetailPresenterProtocol {
    
}
