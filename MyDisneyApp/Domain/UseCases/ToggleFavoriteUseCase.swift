//
//  ToggleFavoriteUseCase.swift
//  MyDisneyApp
//
//  Created by Cinthia Villegas on 28/06/26.
//

struct ToggleFavoriteUseCase {

    private let repository: CharacterRepositoryProtocol

    init(repository: CharacterRepositoryProtocol) {
        self.repository = repository
    }

    func execute(id: Int, isFavorite: Bool) throws {

        try repository.toggleFavorite(
            id: id,
            isFavorite: isFavorite
        )

    }
}
