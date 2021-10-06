//
//  MarvelCharactersApiServiceProvider.swift
//  Week_3
//
//  Created by Erkut Bas on 5.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class MarvelCharactersApiServiceProvider: ApiServiceProvider<BaseRequest> {
    
    static let url = "https://gateway.marvel.com:443/v1/public/characters?ts=8F46CC9B-4885-4D8D-9761-9092B84D4C5A&apikey=b1b6a2c675b36a5e44800a4fbaa2fb8e&hash=68cb7ec069de76b37db17dc7e2aa5b5c&offset=30&limit=30"
    
    init() {
        super.init(method: .get, baseUrl: Self.url)
    }
    
}
