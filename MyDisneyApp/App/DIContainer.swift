//
//  DIContainer.swift
//  MyDisneyApp
//
//  Created by Cinthia Villegas on 28/06/26.
//

import Foundation

final class DIContainer {

    lazy var toggleFavoriteUseCase: ToggleFavoriteUseCase = {
        ToggleFavoriteUseCase(repository: characterRepository)
    }()
    
    lazy var networkService: NetworkServiceProtocol = {
        NetworkService()
    }()

    lazy var localCharacterDataSource: LocalCharacterDataSourceProtocol = {
        LocalCharacterDataSource()
    }()

    lazy var characterRepository: CharacterRepositoryProtocol = {
        CharacterRepository(
            network: networkService,
            localDataSource: localCharacterDataSource
        )
    }()

    lazy var getCharactersUseCase: GetCharactersUseCase = {
        GetCharactersUseCase(repository: characterRepository)
    }()
    
    lazy var getFavoritesUseCase = GetFavoritesUseCase(
        repository: characterRepository
    )
}
