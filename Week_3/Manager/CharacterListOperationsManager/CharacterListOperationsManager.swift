//
//  CharacterListOperationsManager.swift
//  Week_3
//
//  Created by Erkut Bas on 10.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage
import RxSwift

typealias CharacterListResult = Result<CharacterDataResponse, ErrorResponse>
typealias CharacterListResultBlock = (Result<CharacterDataResponse, ErrorResponse>) -> Void

class CharacterListOperationsManager: CharacterListOperationsProtocol {
    
    public static let shared = CharacterListOperationsManager()
    
    private init() { }
    
    private let dataPublishSubject = PublishSubject<CharacterListResult>()
    private let dataFlowSubject = PublishSubject<Bool>()
    
    // MARK: - Public Methods
    func getCharacterListData() {
        fireApiCall(with: apiCallHandler)
    }
    
    func subscribeDataPublisher(with completion: @escaping CharacterListResultBlock) -> Disposable {
        return dataPublishSubject.subscribe(onNext: completion)
    }
    
    func subscribeDataFlow(with completion: @escaping (Bool) -> Void) -> Disposable {
        return dataFlowSubject.subscribe(onNext: completion)
    }
    
    // MARK: - Private Methods
    private func fireApiCall(with completion: @escaping CharacterListResultBlock) {
        
        dataFlowSubject.onNext(false)
        
        do {
            let urlRequest = try MarvelCharactersApiServiceProvider().returnUrlRequest()
            APIManager.shared.executeRequest(urlRequest: urlRequest, completion: completion)
        } catch let error {
            print("error : \(error)")
        }
        
    }
    
    // MARK: - CallBack Listener
    private lazy var apiCallHandler: (Result<CharacterDataResponse, ErrorResponse>) -> Void = { [weak self] result in
        // to show how to handle error .....
        self?.dataPublishSubject.onNext(result)
        self?.dataFlowSubject.onNext(true)

    }
    
}
