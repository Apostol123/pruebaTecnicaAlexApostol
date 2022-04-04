//
//  ListBuilder.swift
//  teladocApp
//
//  Created by Alex Apostol on 4/4/22.
//  
//

import Foundation
import UIKit

class ListBuilder: Builder {
    
   private var coordinatorOutput: (ListOutput) -> Void
    
    init(coordinatorOutput: @escaping (ListOutput) -> Void) {
        self.coordinatorOutput = coordinatorOutput
    }
    
    func build() -> UIViewController {
        let dataManager = ListDataManager()
        let interactor = ListInteractor(dataManager: dataManager)
        let presenter = ListPresenter(interactor: interactor, coordinnatorOutput: coordinatorOutput)
        let view = ListViewController(presenter: presenter)
        presenter.view = view
        return view
    }
    
}
