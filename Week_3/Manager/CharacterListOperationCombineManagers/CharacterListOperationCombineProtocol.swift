//
//  CharacterListOperationCombineProtocol.swift
//  Week_3
//
//  Created by Erkut Bas on 10.10.2021.
//

import Combine

protocol CharacterListOperationCombineProtocol {
    
    func getCharacterListData()
    
    func subscribeDataPublisher(with completion: @escaping CharacterListResultBlock) -> AnyCancellable
    
    func subscribeDataFlow(with completion: @escaping (Bool) -> Void) -> AnyCancellable
    
}
