//
//  CharacterListViewModel.swift
//  Week_3
//
//  Created by Erkut Bas on 2.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class CharacterListViewModel {
    
    deinit {
        print("DEINIT CharacterListViewModel")
    }
    
    private let formatter: CharacterListDataFormatterProtocol
    
    private var data: CharacterDataResponse?
    private var state: CharacterListStateBlock?
    
    init(formatter: CharacterListDataFormatterProtocol) {
        self.formatter = formatter
    }
    
    func subscribeState(completion: @escaping CharacterListStateBlock) {
        state = completion
    }
    
    func getCharacterList() {
        state?(.loading)
        fireApiCall(with: apiCallHandler)
    }
    
    private func fireApiCall(with completion: @escaping (Result<CharacterDataResponse, ErrorResponse>) -> Void) {
        
        do {
            let urlRequest = try MarvelCharactersApiServiceProvider().returnUrlRequest()
            APIManager.shared.executeRequest(urlRequest: urlRequest, completion: completion)
        } catch let error {
            print("error : \(error)")
        }
        
    }
    
    private func dataHandler(with response: CharacterDataResponse) {
        self.data = response
        state?(.done)
    }
    
    // MARK: - CallBack Listener
    private lazy var apiCallHandler: (Result<CharacterDataResponse, ErrorResponse>) -> Void = { [weak self] result in
        // to show how to handle error .....
        switch result {
        case .failure(let error):
            print("error : \(error)")
            self?.state?(.failure)
        case .success(let data):
            self?.dataHandler(with: data)
        }
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
