//
//  ListInteractorProtocol.swift
//  teladocApp
//
//  Created by Alex Apostol on 4/4/22.
//  
//

import Foundation

protocol ListInteractorProtocol : AnyObject {
    func getDestinations(completion: @escaping (Result<Destinations, APIError>) -> Void)
}
