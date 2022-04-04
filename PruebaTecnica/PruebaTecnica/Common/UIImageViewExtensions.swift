//
//  UIImageViewExtensions.swift
//  PruebaTecnica
//
//  Created by Alex Apostol on 4/4/22.
//

import UIKit

extension UIImageView {
    func load(url: URL?) {
        guard let url = url else {return}
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
