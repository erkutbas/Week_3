//
//  TutorialViewModel.swift
//  Week_3
//
//  Created by Erkut Bas on 2.10.2021.
//

import Foundation

class TutorialViewModel {
    
    private let tutorials: [GenericContainerData]
    
    init(tutorials: [GenericContainerData]) {
        self.tutorials = tutorials
    }
    
    func getItem(at index: Int) -> GenericContainerData {
        return tutorials[index]
    }
    
    func getItemCount() -> Int {
        return tutorials.count
    }
    
}
