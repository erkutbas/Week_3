//
//  MainViewModel.swift
//  Week_3
//
//  Created by Erkut Bas on 2.10.2021.
//

import Foundation

class MainViewModel {
    
    private var tutorialFireBlock: (() -> Void)?
    
    init() {
        fireTutorial()
    }
    
    func listenTutorialEvent(with completion: @escaping (() -> Void)) {
        tutorialFireBlock = completion
    }
    
    func fireTutorial() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.tutorialFireBlock?()
        }
    }
    
}
