//
//  FavoriteViewController.swift
//  Week_3
//
//  Created by Erkut Bas on 2.10.2021.
//

import UIKit
import RxSwift

extension Selector {
    static let getDataAction = #selector(FavoriteViewController.getDataAction)
}

class FavoriteViewController: BaseViewController<FavoriteViewModel> {
    
    private let disposeBag = DisposeBag()
    
    private lazy var test: UIButton = {
        let temp = UIButton(type: .system)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.addTarget(self, action: .getDataAction, for: .touchUpInside)
        temp.setTitle("GET CHARACTER LIST", for: .normal)
        return temp
    }()
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        
        view.backgroundColor = .yellow
        
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
    
    @objc func getDataAction(_ sender: UIButton) {
        viewModel.getCharacterListDataExternally()
    }
    
    private func subscribeViewModelPublishers() {
        viewModel.subscribeDataFlow { [weak self] retrived in
            print("DATA HAS ALREADY RETRIEVED : \(retrived)")
            DispatchQueue.main.async {
                self?.dataFlowHandler(with: retrived)
            }
        }
        .disposed(by: disposeBag)
    }
    
    private func dataFlowHandler(with value: Bool) {
        
        UIView.transition(with: test, duration: 0.6, options: .transitionCrossDissolve) {
            if value {
                self.test.setTitle("DATA HAS ALREADY GATHERED", for: .normal)
            } else {
                self.test.setTitle("DATA HAS NOT GATHERED YET", for: .normal)
            }
        }

        
        
    }
    
}
