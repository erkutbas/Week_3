//
//  FavoriteViewModel.swift
//  Week_3
//
//  Created by Erkut Bas on 2.10.2021.
//

import Foundation
import RxSwift

class FavoriteViewModel {
    
    private let operationManager: CharacterListOperationsProtocol
    
    init(operationManager: CharacterListOperationsProtocol) {
        self.operationManager = operationManager
    }
    
    func subscribeDataFlow(with completion: @escaping (Bool) -> Void) -> Disposable {
        return operationManager.subscribeDataFlow(with: completion)
    }
    
    func getCharacterListDataExternally() {
        operationManager.getCharacterListData()
    }
    
}
