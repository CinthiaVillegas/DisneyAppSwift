//
//  LocalCharacterDataSourceProtocol.swift
//  MyDisneyApp
//
//  Created by Cinthia Villegas on 28/06/26.
//

import Foundation

protocol LocalCharacterDataSourceProtocol {

    func save(characters: [Character]) throws

    func fetchCharacters() throws -> [Character]

    func updateFavorite(id: Int, isFavorite: Bool) throws
    
    func fetchFavorites() throws -> [Character]
}
