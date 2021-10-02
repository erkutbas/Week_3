//
//  GenericImageContainerViewModel.swift
//  Week_3
//
//  Created by Erkut Bas on 2.10.2021.
//

import Foundation
import UIKit

class GenericImageContainerViewModel {
    
    private let data: GenericContainerData
    
    init(data: GenericContainerData) {
        self.data = data
    }
    
    func getImage() -> UIImage {
        return data.getImage()
    }
    
    func getIndex() -> Int {
        return data.pageIndex
    }
    
}
