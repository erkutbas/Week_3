//
//  CharacterListViewBuilder.swift
//  Week_3
//
//  Created by Erkut Bas on 2.10.2021.
//

import UIKit

class CharacterListViewBuilder {
    
    class func build() -> UIViewController {
        let characterListFormatter = CharacterListDataFormatter()
        let manager = CharacterListOperationsManager.shared
        let managerCombine = CharacterListOperationCombineManager.shared
        let viewModel = CharacterListViewModel(formatter: characterListFormatter, operationManager: manager, operationManagerCombine: managerCombine)
        let viewController = CharacterListViewController(viewModel: viewModel)
        return viewController
    }
    
}
