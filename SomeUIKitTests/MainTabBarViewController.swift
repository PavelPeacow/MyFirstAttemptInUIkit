//
//  MainTabBarViewController.swift
//  SomeUIKitTests
//
//  Created by Павел Кай on 10.08.2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeViewController = UINavigationController(rootViewController: ViewController())
        let favouritesViewController = UINavigationController(rootViewController: FavouriteViewController())
        
        homeViewController.tabBarItem.image = UIImage(systemName: "list.bullet")
        favouritesViewController.tabBarItem.image = UIImage(systemName: "heart")
        
        homeViewController.title = "Home"
        favouritesViewController.title = "Favourites"
        
        tabBar.tintColor = .black
        
        setViewControllers([homeViewController, favouritesViewController], animated: true)
    }
    



}
