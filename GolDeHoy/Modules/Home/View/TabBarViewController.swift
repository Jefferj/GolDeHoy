//
//  TabBarViewController.swift
//  GolDeHoy
//
//  Created by Jefferson Naranjo rodríguez on 20/12/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let firstTabTitle = "Favorites"
        let firstTabImage = UIImage(systemName: "star")
        let firstTabBarViewController = FavoritesViewController(nibName: "FavoritesViewController", bundle: nil)
        firstTabBarViewController.title = firstTabTitle
        let firstTabNavigationController = UINavigationController(rootViewController: firstTabBarViewController)
        firstTabNavigationController.tabBarItem = UITabBarItem(title: firstTabTitle, image: firstTabImage, selectedImage: nil)
        let secondTabTitle = "Home"
        let secondTabImage = UIImage(systemName: "house")
        let secondTabBarViewController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        secondTabBarViewController.title = secondTabTitle
        let secondTabNavigationController = UINavigationController(rootViewController: secondTabBarViewController)
        secondTabNavigationController.tabBarItem = UITabBarItem(title: secondTabTitle, image: secondTabImage, selectedImage: nil)
        let thirdTabTitle = "Profile"
        let thirdTabImage = UIImage(systemName: "person")
        let thirdTabBarViewController = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        thirdTabBarViewController.title = thirdTabTitle
        let thirTabNavigationController = UINavigationController(rootViewController: thirdTabBarViewController)
        thirTabNavigationController.tabBarItem = UITabBarItem(title: thirdTabTitle, image: thirdTabImage, selectedImage: nil)
        
        viewControllers = [firstTabNavigationController, secondTabNavigationController, thirTabNavigationController]
    }
}
