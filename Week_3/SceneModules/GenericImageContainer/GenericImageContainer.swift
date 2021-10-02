//
//  GenericImageContainer.swift
//  Week_3
//
//  Created by Erkut Bas on 2.10.2021.
//

import UIKit

class GenericImageContainer: BaseViewController<GenericImageContainerViewModel> {

    private lazy var imageComponent: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.contentMode = .scaleAspectFill
        return temp
    }()
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        addImageComponent()
        setDataToImage()
    }
    
    private func addImageComponent() {
        view.addSubview(imageComponent)
        
        NSLayoutConstraint.activate([
        
            imageComponent.heightAnchor.constraint(equalToConstant: 400),
            imageComponent.widthAnchor.constraint(equalToConstant: 300),
            imageComponent.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageComponent.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        
        ])
    }
    
    private func setDataToImage() {
        imageComponent.image = viewModel.getImage()
    }
    
}
