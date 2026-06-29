//
//  CharacterRepository.swift
//  MyDisneyApp
//
//  Created by Cinthia Villegas on 28/06/26.
//

final class CharacterRepository: CharacterRepositoryProtocol {

    private let network: NetworkServiceProtocol
    private let localDataSource: LocalCharacterDataSourceProtocol

    init(
        network: NetworkServiceProtocol,
        localDataSource: LocalCharacterDataSourceProtocol
    ) {
        self.network = network
        self.localDataSource = localDataSource
    }

    func getCharacters() async throws -> [Character] {

        let localCharacters = try localDataSource.fetchCharacters()

        do {
            let remoteCharacters = try await network.fetchCharacters().map {
                $0.toDomain()
            }

            try localDataSource.save(characters: remoteCharacters)

            return try localDataSource.fetchCharacters()

        } catch {
            if !localCharacters.isEmpty {
                return localCharacters
            }

            throw error
        }
    }

    func toggleFavorite(id: Int, isFavorite: Bool) throws {
        try localDataSource.updateFavorite(id: id, isFavorite: isFavorite)
    }
    
    func getFavorites() throws -> [Character] {
        try localDataSource.fetchFavorites()
    }
}
