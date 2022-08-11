//
//  CustomTableViewCell.swift
//  SomeUIKitTests
//
//  Created by Павел Кай on 08.08.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let identifier = "cell"
    
    lazy var image: CustomUIImageView = {
       let image = CustomUIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 5
        return image
    }()
    
    lazy var label: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    lazy var uiView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .red
        return uiView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .orange
        contentView.addSubview(image)
        contentView.addSubview(label)
        
        
        NSLayoutConstraint.activate([
        
            image.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.heightAnchor.constraint(equalToConstant: 50),
            image.widthAnchor.constraint(equalToConstant: 80),
            image.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: -5),
            
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.4),
            

        ])
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
