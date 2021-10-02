//
//  CharacterListViewModel.swift
//  Week_3
//
//  Created by Erkut Bas on 2.10.2021.
//

import Foundation

class CharacterListViewModel {
    
}

extension CharacterListViewModel: ItemListProtocol {
    
    func askNumberOfSection() -> Int {
        return 1
    }
    
    func askNumberOfItem(in section: Int) -> Int {
        return 100
    }
    
    func askData(at index: Int) -> GenericDataProtocol? {
        return nil
    }
    
}
