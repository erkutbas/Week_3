//
//  ViewController4.swift
//  Week_3
//
//  Created by Erkut Bas on 3.10.2021.
//

import UIKit

fileprivate extension Selector {
    static let pushButtonTapped = #selector(ViewController4.pushButtonAction)
}

class ViewController4: UIViewController {
    
    private lazy var test: UIButton = {
        let temp = UIButton(type: .system)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.addTarget(self, action: .pushButtonTapped, for: .touchUpInside)
        temp.setTitle("Push viewController5", for: .normal)
        return temp
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        title = "ViewController4"

        view.addSubview(test)
        
        NSLayoutConstraint.activate([
        
            test.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            test.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        
        ])
    }
    
    @objc fileprivate func pushButtonAction(_ sender: UIButton) {
        let viewController = ViewController5()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    

}
