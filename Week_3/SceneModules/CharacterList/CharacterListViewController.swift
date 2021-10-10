//
//  CharacterListViewController.swift
//  Week_3
//
//  Created by Erkut Bas on 2.10.2021.
//

import UIKit

class CharacterListViewController: BaseViewController<CharacterListViewModel> {
    
    deinit {
        print("DEINIT CharacterListViewController")
        NotificationCenter.default.removeObserver(self, name: .sampleNotif, object: nil)
    }
    
    //private var mainComponent: mainComponent!
    private var mainComponent: ItemListView!

    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        // adding major components
        addmainComponent()
        
        // listen view states
        subscribeViewModelListeners()
        addObserver()
        
        // fire getting data
//        viewModel.getCharacterList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func addmainComponent() {
        //mainComponent = mainComponent()
        mainComponent = ItemListView()
        mainComponent.translatesAutoresizingMaskIntoConstraints = false
        
        mainComponent.delegate = viewModel
        
        view.addSubview(mainComponent)
        
        NSLayoutConstraint.activate([
        
            mainComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainComponent.topAnchor.constraint(equalTo: view.topAnchor),
            mainComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
    
    private func subscribeViewModelListeners() {
        
        viewModel.subscribeState { [weak self] state in
            switch state {
            case .done:
                print("data is ready")
                //self?.mainComponent.reloadTableView()
            case .loading:
                print("data is getting")
            case .failure:
                print("errror")
                // show alert popup
            }
        }
    }
    
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: .doThisAction, name: .sampleNotif, object: nil)
    }
    
    @objc fileprivate func doThisAction(_ sender: Notification) {
        print("\(#function)")
        mainComponent.reloadTableView()
    }
    
}

// MARK: - Notification Name Extensions
extension Notification.Name {
    static let sampleNotif = Notification.Name("sampleNotif")
    static let getDataByUsingExternalInteractions = Notification.Name("getDataByUsingExternalInteractions")
}

// MARK: - Selector Extensions
extension Selector {
    static let doThisAction = #selector(CharacterListViewController.doThisAction)
}
