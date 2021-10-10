//
//  CharacterListViewModel.swift
//  Week_3
//
//  Created by Erkut Bas on 2.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage
import RxSwift
import Combine

class CharacterListViewModel {
    
    private var subscriptions = Set<AnyCancellable>()
    
    deinit {
        print("DEINIT CharacterListViewModel")
    }
    
    private let disposeBag = DisposeBag()
    
    private let formatter: CharacterListDataFormatterProtocol
    private let operationManager: CharacterListOperationsProtocol
    private let operationManagerCombine: CharacterListOperationCombineProtocol
    
    private var data: CharacterDataResponse?
    private var state: CharacterListStateBlock?
    
    init(formatter: CharacterListDataFormatterProtocol,
         operationManager: CharacterListOperationsProtocol,
         operationManagerCombine: CharacterListOperationCombineProtocol) {
        self.formatter = formatter
        self.operationManager = operationManager
        self.operationManagerCombine = operationManagerCombine
        subscribeOperationManagerPublisher()
    }
    
    func subscribeState(completion: @escaping CharacterListStateBlock) {
        state = completion
    }
    
    func getCharacterList() {
        state?(.loading)
        //operationManager.getCharacterListData()
        operationManagerCombine.getCharacterListData()
    }
    
    private func dataHandler(with response: CharacterDataResponse) {
        data = response
        state?(.done)
    }
    
    private func subscribeOperationManagerPublisher() {
//        operationManager.subscribeDataPublisher { [weak self] result in
//            switch result {
//            case .failure(let error):
//                print("error : \(error)")
//            case .success(let response):
//                self?.dataHandler(with: response)
//            }
//        }.disposed(by: disposeBag)
        
        operationManagerCombine.subscribeDataPublisher { [weak self] result in
            switch result {
            case .failure(let error):
                print("error : \(error)")
            case .success(let response):
                self?.dataHandler(with: response)
            }
        }.store(in: &subscriptions)

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
