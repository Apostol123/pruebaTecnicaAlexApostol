//
//  ListPresenter.swift
//  teladocApp
//
//  Created by Alex Apostol on 4/4/22.
//  
//

import Foundation

class ListPresenter {
    var interactor: ListInteractorProtocol
    weak var view: ListViewProtocol?
    var coordinatorOutput: (ListOutput) -> Void

    init(interactor: ListInteractorProtocol, coordinnatorOutput: @escaping (ListOutput) -> Void) {
        self.interactor = interactor
        self.coordinatorOutput = coordinnatorOutput
    }
}

extension ListPresenter: ListPresenterProtocol {
    
}
