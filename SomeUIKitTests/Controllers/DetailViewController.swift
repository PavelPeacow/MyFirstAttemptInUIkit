//
//  DetailViewController.swift
//  SomeUIKitTests
//
//  Created by Павел Кай on 10.08.2022.
//

import UIKit

class DetailViewController: UIViewController {

    lazy var catImage: UIImageView = {
        catImage = UIImageView()
        catImage.translatesAutoresizingMaskIntoConstraints = false
        catImage.image = UIImage(named: "cat")
        catImage.clipsToBounds = true
        catImage.contentMode = .scaleAspectFill
        catImage.layer.cornerRadius = 50
        return catImage
    }()
    
    lazy var catDescription: UILabel = {
        catDescription = UILabel()
        catDescription.translatesAutoresizingMaskIntoConstraints = false
        
        catDescription.text = """
            Popular since the 19th century, this cat breed originated in Thailand (formerly known as Siam). The Siamese has been a foundational breed for the Oriental shorthair, sphynx, and Himalayan. Most Siamese cats have distinct markings called "points" that are the areas of coloration on their face, ears, feet, and tail. Two varieties of Siamese cats have an "apple" shaped head and chubbier body and the other features a larger head and slender body. The animated Disney film "Lady and the Tramp" featured Siamese cats singing a song, demonstrating their intelligence and vocal skills. Many Siamese cats that originated from Thailand had a kink in their tail—a trait bred out of most Siamese, but you can still see it in street cats in Thailand.
        """
        catDescription.numberOfLines = 0
        return catDescription
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .orange
        
        
        view.addSubview(catImage)
        view.addSubview(catDescription)
        
        title = "An old cat"
        
        NSLayoutConstraint.activate([
            catImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            catImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            catImage.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            catImage.heightAnchor.constraint(equalToConstant: 250),
            
            catDescription.topAnchor.constraint(equalTo: catImage.bottomAnchor, constant: 15),
            catDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            catDescription.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
        ])
    }
    



}
