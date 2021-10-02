//
//  MainViewBuilder.swift
//  Week_3
//
//  Created by Erkut Bas on 2.10.2021.
//

import UIKit

class MainViewBuilder {
    
    class func build() -> UIViewController {

        let viewModel = MainViewModel()
        let viewController = MainViewController(viewModel: viewModel)
        let navigationViewController = UINavigationController(rootViewController: viewController)
        viewController.title = "Main"
        viewController.tabBarItem.image = TabBarImages.home.value
        viewController.tabBarItem.selectedImage = TabBarImages.homeSelected.value
        viewController.navigationController?.setNavigationBarHidden(true, animated: false)

        return navigationViewController

    }
    
}
