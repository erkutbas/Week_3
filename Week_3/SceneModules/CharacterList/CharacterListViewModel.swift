//
//  CharacterListViewModel.swift
//  Week_3
//
//  Created by Erkut Bas on 2.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage
import RxSwift

class CharacterListViewModel {
    
    deinit {
        print("DEINIT CharacterListViewModel")
    }
    
    private let disposeBag = DisposeBag()
    
    private let formatter: CharacterListDataFormatterProtocol
    private let operationManager: CharacterListOperationsProtocol
    
    private var data: CharacterDataResponse?
    private var state: CharacterListStateBlock?
    
    init(formatter: CharacterListDataFormatterProtocol,
         operationManager: CharacterListOperationsProtocol) {
        self.formatter = formatter
        self.operationManager = operationManager
        subscribeOperationManagerPublisher()
    }
    
    func subscribeState(completion: @escaping CharacterListStateBlock) {
        state = completion
    }
    
    func getCharacterList() {
        state?(.loading)
        operationManager.getCharacterListData()
    }
    
    private func dataHandler(with response: CharacterDataResponse) {
        data = response
        state?(.done)
    }
    
    private func subscribeOperationManagerPublisher() {
        operationManager.subscribeDataPublisher { [weak self] result in
            switch result {
            case .failure(let error):
                print("error : \(error)")
            case .success(let response):
                self?.dataHandler(with: response)
            }
        }.disposed(by: disposeBag)
    }
    
}

// MARK: - ItemListProtocol
extension CharacterListViewModel: ItemListProtocol {
    
    func askNumberOfSection() -> Int {
        return 1
    }
    
    func askNumberOfItem(in section: Int) -> Int {
        guard let dataUnwrapped = data else { return 0 }
        return dataUnwrapped.data.results.count
    }
    
    func askData(at index: Int) -> GenericDataProtocol? {
        guard let dataUnwrapped = data else { return nil }
        return formatter.getItem(from: dataUnwrapped.data.results[index])
    }
    
}
