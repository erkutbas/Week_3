//
//  ViewController5.swift
//  Week_3
//
//  Created by Erkut Bas on 3.10.2021.
//

import Foundation
import UIKit

fileprivate extension Selector {
    static let pushButtonTapped = #selector(ViewController5.pushButtonAction)
    static let popButtonTapped = #selector(ViewController5.popButtonAction)
}

class ViewController5: UIViewController {
    
    private lazy var test: UIButton = {
        let temp = UIButton(type: .system)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.addTarget(self, action: .pushButtonTapped, for: .touchUpInside)
        temp.setTitle("Push viewController3", for: .normal)
        return temp
    }()
    
    private lazy var testPop: UIButton = {
        let temp = UIButton(type: .system)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.addTarget(self, action: .popButtonTapped, for: .touchUpInside)
        temp.setTitle("Pop to viewController3", for: .normal)
        return temp
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        
        title = "ViewController5"

        view.addSubview(test)
        view.addSubview(testPop)
        
        NSLayoutConstraint.activate([
        
            test.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            test.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            testPop.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testPop.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100)
        
        ])
    }
    
    @objc fileprivate func pushButtonAction(_ sender: UIButton) {
        let viewController = ViewController3()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc fileprivate func popButtonAction(_ sender: UIButton) {
        guard let viewController = navigationController?.viewControllers.filter({ $0.isKind(of: ViewController3.self) }).first else { return }
        self.navigationController?.popToViewController(viewController, animated: true)
    }
    

}
