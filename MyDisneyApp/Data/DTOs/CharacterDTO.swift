//
//  CharacterDTO.swift
//  MyDisneyApp
//
//  Created by Cinthia Villegas on 28/06/26.
//

import Foundation



struct CharacterResponseDTO: Decodable {
    let data: [CharacterDTO]
}

struct CharacterDTO: Decodable {

    let id: Int
    let name: String
    let imageUrl: String?
    let films: [String]
    let tvShows: [String]
    let videoGames: [String]
    var isFavorite: Bool = false

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case imageUrl
        case films
        case tvShows
        case videoGames
    }
}

extension CharacterDTO {
    func toDomain() -> Character {
        Character(
            id: id,
            name: name,
            imageURL: imageUrl ?? "",
            films: films,
            tvShows: tvShows,
            videoGames: videoGames,
            isFavorite: false
        )
    }
}

