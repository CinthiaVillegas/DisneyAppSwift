//
//  GetFavoritesUseCase.swift
//  MyDisneyApp
//
//  Created by Cinthia Villegas on 28/06/26.
//

struct GetFavoritesUseCase {

    private let repository: CharacterRepositoryProtocol

    init(repository: CharacterRepositoryProtocol) {
        self.repository = repository
    }

    func execute() throws -> [Character] {
        try repository.getFavorites()
    }
}
