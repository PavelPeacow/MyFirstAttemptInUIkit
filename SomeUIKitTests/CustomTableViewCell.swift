//
//  CustomTableViewCell.swift
//  SomeUIKitTests
//
//  Created by Павел Кай on 08.08.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let identifier = "cell"
    
    lazy private var image: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "cat")
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy private var label: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "An old cat"
        return label
    }()
    
    lazy private var uiView: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .red
        return uiView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .orange
        contentView.addSubview(image)
        contentView.addSubview(label)
        contentView.addSubview(uiView)
        uiView.addSubview(image)
        uiView.bringSubviewToFront(image)
        
        NSLayoutConstraint.activate([
        
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.heightAnchor.constraint(equalToConstant: 150),
            image.widthAnchor.constraint(equalToConstant: 150),
            
            label.trailingAnchor.constraint(equalTo: image.trailingAnchor, constant: 80),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            uiView.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 50),
            uiView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: 50),
            uiView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            uiView.heightAnchor.constraint(equalToConstant: 150),
            uiView.widthAnchor.constraint(equalToConstant: 150),
        ])
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
