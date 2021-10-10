//
//  FavoriteViewBuilder.swift
//  Week_3
//
//  Created by Erkut Bas on 2.10.2021.
//

import UIKit

class FavoriteViewBuilder {
    
    class func build() -> UIViewController {
        let manager = CharacterListOperationsManager.shared
        let managerCombine = CharacterListOperationCombineManager.shared
        let viewModel = FavoriteViewModel(operationManager: manager, operationManagerCombine: managerCombine)
        let viewController = FavoriteViewController(viewModel: viewModel)
        viewController.title = "Favorite"
        viewController.tabBarItem.image = TabBarImages.favorite.value
        viewController.tabBarItem.selectedImage = TabBarImages.favoriteSelected.value
        return viewController
        
    }
    
}
