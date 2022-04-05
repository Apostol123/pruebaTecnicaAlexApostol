//
//  DestinationDetailBuilder.swift
//  teladocApp
//
//  Created by Alex Apostol on 5/4/22.
//  
//

import Foundation
import UIKit

class DestinationDetailBuilder: Builder {
    
    private var coordinatorOutput: (DestinationDetailOutput) -> Void
    private  let destinationResult: DestinationsResult
    
    init(destinationResult: DestinationsResult, coordinatorOutput: @escaping (DestinationDetailOutput) -> Void) {
        self.destinationResult = destinationResult
        self.coordinatorOutput = coordinatorOutput
    }
    
    func build() -> UIViewController {
        let dataManager = DestinationDetailDataManager()
        let interactor = DestinationDetailInteractor(dataManager: dataManager)
        let presenter = DestinationDetailPresenter(destinationResult: destinationResult, interactor: interactor, coordinnatorOutput: coordinatorOutput)
        let view = DestinationDetailViewController(presenter: presenter)
        presenter.view = view
        return view
    }
    
}
