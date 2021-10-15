//
//  HeaderProvider.swift
//  Week_3
//
//  Created by Erkut Bas on 15.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class HeaderProvider: HeaderProviderProtocol {
    
    func getHeaders() -> HTTPHeaders {
        var headers = HTTPHeaders()
        headers.add(HTTPHeader(name: "xx", value: "aaaaa"))
        headers.add(HTTPHeader(name: "yy", value: "bbbbb"))
        headers.add(HTTPHeader(name: "Content-Type", value: "application/json"))
        return headers
    }
    
}
