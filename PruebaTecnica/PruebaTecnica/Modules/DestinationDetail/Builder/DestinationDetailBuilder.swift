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
    
    func build() -> UIViewController {
        let dataManager = DestinationDetailDataManager()
        let interactor = DestinationDetailInteractor(dataManager: dataManager)
        let presenter = DestinationDetailPresenter(interactor: interactor)
        let view = DestinationDetailViewController(presenter: presenter)
        presenter.view = view
        return view
    }
    
}
