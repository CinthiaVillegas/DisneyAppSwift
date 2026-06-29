//
//  FavoritesView.swift
//  MyDisneyApp
//
//  Created by Cinthia Villegas on 28/06/26.
//

import SwiftUI

struct FavoritesView: View {

    @StateObject
    private var viewModel: FavoritesViewModel

    init(container: DIContainer) {
        _viewModel = StateObject(
            wrappedValue: FavoritesViewModel(
                getFavorites: container.getFavoritesUseCase
            )
        )
    }

    var body: some View {

        NavigationStack {

            ScrollView {

                LazyVStack(spacing: 16) {

                    ForEach(viewModel.favorites) { character in

                        CharacterRow(character: character) {
                            print("Hola")
                        }

                    }

                }
                .padding()

            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Lista de los mejores")
            .onAppear {
                viewModel.loadFavorites()
            }

        }
    }
}
