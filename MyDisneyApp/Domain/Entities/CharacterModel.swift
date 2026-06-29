//
//  CharacterModel.swift
//  MyDisneyApp
//
//  Created by Cinthia Villegas on 28/06/26.
//

struct Character: Identifiable, Equatable {
    let id: Int
    let name: String
    let imageURL: String
    let films: [String]
    let tvShows: [String]
    let videoGames: [String]
    var isFavorite: Bool
}
