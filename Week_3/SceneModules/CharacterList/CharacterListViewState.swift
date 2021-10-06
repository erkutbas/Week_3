//
//  CharacterListViewState.swift
//  Week_3
//
//  Created by Erkut Bas on 5.10.2021.
//

import Foundation

typealias CharacterListStateBlock = (CharacterListViewState) -> Void

enum CharacterListViewState {
    
    case loading
    case done
    
}
