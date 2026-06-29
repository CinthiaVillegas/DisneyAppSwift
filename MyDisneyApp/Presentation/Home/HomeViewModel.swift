//
//  HomeViewModel.swift
//  MyDisneyApp
//
//  Created by Cinthia Villegas on 28/06/26.
//

import Foundation
import Combine

@MainActor
final class HomeViewModel: ObservableObject {

    @Published var characters: [Character] = []
    @Published var state: ViewState = .loading

    private let getCharacters: GetCharactersUseCase
    private let toggleFavorite: ToggleFavoriteUseCase

    init(
        getCharacters: GetCharactersUseCase,
        toggleFavorite: ToggleFavoriteUseCase
    ) {

        self.getCharacters = getCharacters
        self.toggleFavorite = toggleFavorite

    }

    func loadCharacters() async {

        print("Inicio carga")

        state = .loading

        do {

            characters = try await getCharacters.execute()

            print("Se obtuvieron \(characters.count)")

            state = characters.isEmpty ? .empty : .success

        } catch {

            print(error)

            state = .error(error.localizedDescription)

        }
    }
    
    func toggleFavorite(for character: Character) {

        guard let index = characters.firstIndex(where: {
            $0.id == character.id
        }) else {
            return
        }

        characters[index].isFavorite.toggle()

        do {

            try toggleFavorite.execute(
                id: character.id,
                isFavorite: characters[index].isFavorite
            )

        } catch {

            print(error)

        }

    }
}
