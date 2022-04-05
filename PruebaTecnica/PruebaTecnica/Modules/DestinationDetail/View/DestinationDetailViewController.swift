//
//  DestinationDetailViewController.swift
//  teladocApp
//
//  Created by Alex Apostol on 5/4/22.
//  
//

import UIKit

class DestinationDetailViewController: UIViewController {
    
    let presenter: DestinationDetailPresenterProtocol
        
    init (presenter: DestinationDetailPresenterProtocol) {
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

extension DestinationDetailViewController: DestinationDetailViewProtocol{
    // TODO: Implement View Output Methods
}
