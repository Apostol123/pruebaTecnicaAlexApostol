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
    var viewTitle: String {get}
    var searchBarPlaceHolder: String {get}
    func filterContentForSearchText(text: String,  arrayToFilter:[DestinationsResult]) -> [DestinationsResult]  
}
