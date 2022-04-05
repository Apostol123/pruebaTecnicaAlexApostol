//
//  ListViewControllerProtocol.swift
//  teladocApp
//
//  Created by Alex Apostol on 4/4/22.
//  
//

import UIKit

protocol ListViewProtocol: AnyObject, Loader {
    func show(content: [DestinationsResult])
}
