//
//  MainTabBarBuilder.swift
//  Week_3
//
//  Created by Erkut Bas on 2.10.2021.
//

import UIKit

class MainTabBarBuilder {
    
    class func build() -> UIViewController {
        
        let mainViewController = MainViewBuilder.build()
        let favoriteViewController = FavoriteViewBuilder.build()
        let tutorialViewController = TutorialViewBuilder.build()
        let jumper = ViewController1()
        let navigationController = UINavigationController(rootViewController: jumper)
        jumper.title = "Jumper"
        jumper.tabBarItem.image = TabBarImages.bug.value
        jumper.tabBarItem.selectedImage = TabBarImages.bugSelected.value

        let tabViewController = MainTabBarController()
        tabViewController.viewControllers = [mainViewController,
                                             favoriteViewController,
                                             navigationController]
        tabViewController.tabBar.tintColor = .black
        tabViewController.tabBar.backgroundColor = .systemBackground
        
        return tabViewController
        
    }
    
}
