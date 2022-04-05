//
//  ListCell.swift
//  PruebaTecnica
//
//  Created by Alex Apostol on 4/4/22.
//

import Foundation
import UIKit

class ListCell: UITableViewCell {
    
    private lazy var destinationImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.heightAnchor.constraint(equalToConstant: 80).isActive = true
        image.widthAnchor.constraint(equalToConstant: 120).isActive = true
        return image
    }()
    
    private lazy var addressLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var mainStack: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [destinationImage, addressLabel])
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(address: String, imageUrl: String) {
        self.addressLabel.text = address
        self.destinationImage.load(url: URL(string: imageUrl), placeHolder: "DestinationplaceHolder")
    }
    
    private func commonInit() {
        self.selectionStyle = .none
        self.contentView.addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        mainStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
