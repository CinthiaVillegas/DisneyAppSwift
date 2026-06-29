//
//  CharacterRepositoryProtocol.swift
//  MyDisneyApp
//
//  Created by Cinthia Villegas on 28/06/26.
//

protocol CharacterRepositoryProtocol {
    func getCharacters() async throws -> [Character]
    func toggleFavorite(id: Int, isFavorite: Bool) throws
    func getFavorites() throws -> [Character]
}
