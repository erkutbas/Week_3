//
//  CharacterListDataFormatterProtocol.swift
//  Week_3
//
//  Created by Erkut Bas on 9.10.2021.
//

import Foundation

protocol CharacterListDataFormatterProtocol {
    
    func getItem(from data: CharacterData) -> ItemTableViewCellData 
    
}
