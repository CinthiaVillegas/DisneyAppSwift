//
//  CharacterDetailView.swift
//  MyDisneyApp
//
//  Created by Cinthia Villegas on 28/06/26.
//

import SwiftUI

struct CharacterDetailView: View {

    let character: Character

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                AsyncImage(url: URL(string: character.imageURL)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 20))

                Text(character.name)
                    .font(.largeTitle)
                    .bold()

                InfoSection(title: "Películas", items: character.films)
                InfoSection(title: "Series", items: character.tvShows)
                InfoSection(title: "Videojuegos", items: character.videoGames)
            }
            .padding()
        }
        .navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

private struct InfoSection: View {

    let title: String
    let items: [String]

    var body: some View {
        if !items.isEmpty {
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.headline)

                ForEach(items, id: \.self) { item in
                    Text("• \(item)")
                        .font(.body)
                }
            }
        }
    }
}
