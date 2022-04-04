//
//  MainCoordinator.swift
//  PruebaTecnica
//
//  Created by Alex Apostol on 4/4/22.
//

import UIKit

class MainCoordinator: Coordinator {

    private var navigator: UINavigationController
    
    enum MainCoordinatorState {
        case initial
        case willShowListFlow
    }
    
    private var state: MainCoordinatorState
    
    init(with navigator: UINavigationController, state: MainCoordinatorState) {
        self.navigator = navigator
        self.state = state
    }
    
    func start() {
        self.loop()
    }
    
    private func loop() {
        self.state = next(self.state)
        switch  self.state {
        case .willShowListFlow:
            goToListFlow()
        case .initial:
            fatalError("Unexpected Case in Main Coordinator")
        }
    }
    
    private func next(_ nextState: MainCoordinatorState) -> MainCoordinatorState {
        switch nextState {
        case .initial:
            return .willShowListFlow
        case .willShowListFlow:
            return nextState
        }
    }
    
    
    private func goToListFlow() {
        let vc = ListBuilder { _ in
            
        }.build()
        vc.view.backgroundColor = .red
        self.navigator.setViewControllers([vc], animated: true)
    }
    
}
