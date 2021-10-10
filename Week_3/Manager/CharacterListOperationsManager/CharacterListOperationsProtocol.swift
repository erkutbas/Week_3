//
//  CharacterListOperationsProtocol.swift
//  Week_3
//
//  Created by Erkut Bas on 10.10.2021.
//

import Foundation
import RxSwift

protocol CharacterListOperationsProtocol {
    
    func getCharacterListData()
    
    func subscribeDataPublisher(with completion: @escaping CharacterListResultBlock) -> Disposable
    
    func subscribeDataFlow(with completion: @escaping (Bool) -> Void) -> Disposable
    
}
