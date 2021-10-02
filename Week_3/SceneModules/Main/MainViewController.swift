//
//  MainViewController.swift
//  Week_3
//
//  Created by Erkut Bas on 2.10.2021.
//

import UIKit

extension Selector {
    static let testButtonTapped = #selector(MainViewController.testButtonAction)
}

class MainViewController: BaseViewController<MainViewModel> {

    private lazy var test: UIButton = {
        let temp = UIButton(type: .system)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.addTarget(self, action: .testButtonTapped, for: .touchUpInside)
        temp.setTitle("PUSH", for: .normal)
        //temp.setTitleColor(.black, for: .normal)
        return temp
    }()
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        
        view.backgroundColor = .green
        
        view.addSubview(test)
        
        NSLayoutConstraint.activate([
        
            test.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            test.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        ])
        
        subscribeViewModelPublishers()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc func testButtonAction(_ sender: UIButton) {
        
        fireCharacterListView()
        
//        let viewController = TestViewController()
//        viewController.title = "TEST"
////        self.navigationController?.pushViewController(viewController, animated: true)
////
//        let newNavigationController = UINavigationController(rootViewController: viewController)
//        newNavigationController.navigationBar.backgroundColor = .red
//        newNavigationController.navigationBar.tintColor = .green
//        self.present(newNavigationController, animated: true, completion: nil)
    }
    
    private func fireCharacterListView() {
        let characterListView = CharacterListViewBuilder.build()
        self.navigationController?.pushViewController(characterListView, animated: true)
    }
    
    private func subscribeViewModelPublishers() {
        viewModel.listenTutorialEvent { [weak self] in
            self?.fireTutorialView()
        }
    }
    
    private func fireTutorialView() {
        guard let topViewController = UIApplication.topViewController() else { return }
        topViewController.present(TutorialViewBuilder.build(), animated: true, completion: nil)
    }
    
}
