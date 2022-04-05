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
        case didShowDestinationList(destination: DestinationsResult)
        case willShowDestinationDetail(destination: DestinationsResult)
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
        case .willShowDestinationDetail(let destination):
            goToDestionationDetailFlow(destinationResult: destination)
        case .initial, .didShowDestinationList:
            fatalError("Unexpected Case in Main Coordinator")
        }
    }
    
    private func next(_ nextState: MainCoordinatorState) -> MainCoordinatorState {
        switch nextState {
        case .initial:
            return .willShowListFlow
        case .didShowDestinationList(let destinationResult):
            return .willShowDestinationDetail(destination: destinationResult)
        case .willShowListFlow, .willShowDestinationDetail:
            return nextState
       
        }
    }
    
    
    private func goToListFlow() {
        let vc = ListBuilder { output in
            
            switch output {
            case .goToDestinationDetail(let destination):
                self.state = .didShowDestinationList(destination: destination)
                self.loop()
            }
            
        }.build()
        self.navigator.setViewControllers([vc], animated: true)
    }
    
    private func goToDestionationDetailFlow(destinationResult: DestinationsResult) {
        let vc = DestinationDetailBuilder(destinationResult: destinationResult) { _ in
            
        }.build()
        navigator.pushViewController(vc, animated: true)
    }
    
}
