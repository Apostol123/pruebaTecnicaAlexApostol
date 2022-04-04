//
//  ListViewController.swift
//  teladocApp
//
//  Created by Alex Apostol on 4/4/22.
//  
//

import UIKit

class ListViewController: UIViewController {
    
    let presenter: ListPresenterProtocol
        
    init (presenter: ListPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension ListViewController: ListViewProtocol{
    // TODO: Implement View Output Methods
}
