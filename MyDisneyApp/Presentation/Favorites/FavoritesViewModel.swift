//
//  FavoritesViewModel.swift
//  MyDisneyApp
//
//  Created by Cinthia Villegas on 28/06/26.
//

import Foundation
import Combine

@MainActor
final class FavoritesViewModel: ObservableObject {

    @Published var favorites: [Character] = []

    private let getFavorites: GetFavoritesUseCase

    init(getFavorites: GetFavoritesUseCase) {
        self.getFavorites = getFavorites
    }

    func loadFavorites() {

        do {

            favorites = try getFavorites.execute()

        } catch {

            print(error)

        }

    }

}
