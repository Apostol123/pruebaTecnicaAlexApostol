//
//  ListPresenterProtocol.swift
//  teladocApp
//
//  Created by Alex Apostol on 4/4/22.
//  
//

import Foundation

protocol ListPresenterProtocol: AnyObject {
    func viewDidLoad()
    func didSelectDestinationListItem(destinationResult: DestinationsResult)
}
