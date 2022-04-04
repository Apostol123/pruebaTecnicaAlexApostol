//
//  ListPresenter.swift
//  teladocApp
//
//  Created by Alex Apostol on 4/4/22.
//  
//

import Foundation

class ListPresenter {
    private var interactor: ListInteractorProtocol
    weak var view: ListViewProtocol?
    private var coordinatorOutput: (ListOutput) -> Void

    init(interactor: ListInteractorProtocol, coordinnatorOutput: @escaping (ListOutput) -> Void) {
        self.interactor = interactor
        self.coordinatorOutput = coordinnatorOutput
    }
}

extension ListPresenter: ListPresenterProtocol {
    func viewDidLoad() {
        self.interactor.getDestinations { result in
            switch result {
            case .success(let destinations):
                self.view?.show(content: destinations.results ?? [])
            case .failure(let error):
                print(error)
            }
        }
    }
}
