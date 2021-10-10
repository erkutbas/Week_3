//
//  FavoriteViewController.swift
//  Week_3
//
//  Created by Erkut Bas on 2.10.2021.
//

import UIKit

extension Selector {
    static let getDataAction = #selector(FavoriteViewController.getDataAction)
}

class FavoriteViewController: BaseViewController<FavoriteViewModel> {
    
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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc func getDataAction(_ sender: UIButton) {
        NotificationCenter.default.post(name: .getDataByUsingExternalInteractions, object: nil)
    }
    
}
