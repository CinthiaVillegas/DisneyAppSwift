//
//  GetCharactersUseCase.swift
//  MyDisneyApp
//
//  Created by Cinthia Villegas on 28/06/26.
//

import Foundation

struct GetCharactersUseCase {

    private let repository: CharacterRepositoryProtocol

    init(repository: CharacterRepositoryProtocol) {
        self.repository = repository
    }

    func execute() async throws -> [Character] {
        try await repository.getCharacters()
    }
}
