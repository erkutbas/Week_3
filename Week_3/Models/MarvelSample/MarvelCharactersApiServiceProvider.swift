//
//  MarvelCharactersApiServiceProvider.swift
//  Week_3
//
//  Created by Erkut Bas on 5.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class MarvelCharactersApiServiceProvider: ApiServiceProvider<BaseRequest> {
    
    static let url = "https://gateway.marvel.com:443/v1/public/characters?ts=8F46CC9B-4885-4D8D-9761-9092B84D4C5A&apikey=b1b6a2c675b36a5e44800a4fbaa2fb8e&hash=68cb7ec069de76b37db17dc7e2aa5b5c&offset=0&limit=30"
    
    init(headerProvider: HeaderProviderProtocol) {
        super.init(method: .get, baseUrl: Self.url, headerProvider: headerProvider)
    }
    
}

enum Takasi: GenericValueProtocol {
    
    typealias Value = String
    
    var value: String {
        switch self {
        case .rick:
            return "api/character"
        case .morty(let id):
            return "api/character/\(id)"
        }
    }
    
    case rick
    case morty(Int)
}

class RickAndMortyApiServiceProvider: ApiServiceProvider<RickAndMortyRequest> {
    
    static let url = "https://rickandmortyapi.com/"
    
    init(request: RickAndMortyRequest) {
        super.init(method: .get, baseUrl: Self.url, path: Takasi.rick.value, data: request)
    }
    
}

class RickAndMortyRequest: Codable {
    let page: Int
    init(page: Int) {
        self.page = page
    }
}


// MARK: - RickAndMortyResponse
class RickAndMortyResponse: Codable {
    let info: Info
    let results: [ResultData]

    init(info: Info, results: [ResultData]) {
        self.info = info
        self.results = results
    }
}

// MARK: - Info
class Info: Codable {
    let count, pages: Int
    let next, prev: String

    init(count: Int, pages: Int, next: String, prev: String) {
        self.count = count
        self.pages = pages
        self.next = next
        self.prev = prev
    }
}

// MARK: - Result
class ResultData: Codable {
    let id: Int
    let name: String
    let status: Status
    let species, type: String
    let gender: Gender
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String

    init(id: Int, name: String, status: Status, species: String, type: String, gender: Gender, origin: Location, location: Location, image: String, episode: [String], url: String, created: String) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
        self.url = url
        self.created = created
    }
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
class Location: Codable {
    let name: String
    let url: String

    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
