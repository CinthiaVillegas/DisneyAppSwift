//
//  CharacterRow.swift
//  MyDisneyApp
//
//  Created by Cinthia Villegas on 28/06/26.
//

import SwiftUI

struct CharacterRow: View {

    let character: Character
    let onFavoriteTap: () -> Void

    var body: some View {
        HStack(spacing: 16) {

            AsyncImage(url: URL(string: character.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 80, height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 12))

            Text(character.name)
                .font(.headline)

            Spacer()

            Button {
                onFavoriteTap()
            } label: {
                Image(systemName: character.isFavorite ? "heart.fill" : "heart")
                    .foregroundStyle(character.isFavorite ? .pink : .gray)
                    .font(.title2)
            }
            .buttonStyle(.plain)
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .shadow(radius: 3)
    }
}
