//
//  HomeView.swift
//  MyDisneyApp
//
//  Created by Cinthia Villegas on 28/06/26.
//

import SwiftUI

@MainActor
struct HomeView: View {

    @StateObject
    private var viewModel: HomeViewModel
    
    init(container: DIContainer) {
        _viewModel = StateObject(
            wrappedValue: HomeViewModel(
                getCharacters: container.getCharactersUseCase,
                toggleFavorite: container.toggleFavoriteUseCase
            )
        )
    }

    var body: some View {

        NavigationStack {

            ZStack {

                Color(.systemGroupedBackground)
                    .ignoresSafeArea()

                switch viewModel.state {

                case .loading:

                    ProgressView()

                case .success:

                    List(viewModel.characters) { character in

                        NavigationLink {
                            CharacterDetailView(character: character)
                        } label: {
                            CharacterRow(character: character) {
                                viewModel.toggleFavorite(for: character)
                            }
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)

                case .empty:

                    VStack(spacing: 16) {

                        Image(systemName: "person.slash")
                            .font(.largeTitle)

                        Text("Sin personajes")
                            .font(.headline)

                    }

                case .error(let message):

                    VStack(spacing: 16) {

                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.red)

                        Text(message)
                            .multilineTextAlignment(.center)

                    }
                    .padding()
                }
            }
            .navigationTitle("Personajes de disney")
            .task {
                await viewModel.loadCharacters()
            }
        }
    }
}
