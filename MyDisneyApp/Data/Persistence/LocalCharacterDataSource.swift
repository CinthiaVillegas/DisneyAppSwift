//
//  LocalCharacterDataSource.swift
//  MyDisneyApp
//
//  Created by Cinthia Villegas on 28/06/26.
//

import CoreData

final class LocalCharacterDataSource: LocalCharacterDataSourceProtocol {

    private let context = CoreDataStack.shared.viewContext

    func fetchCharacters() throws -> [Character] {

        let request: NSFetchRequest<CharacterEntity> = CharacterEntity.fetchRequest()

        let entities = try context.fetch(request)

        return entities.map {

            Character(
                id: Int($0.id),
                name: $0.name ?? "",
                imageURL: $0.imageURL ?? "",
                films: $0.films as? [String] ?? [],
                tvShows: $0.tvShows as? [String] ?? [],
                videoGames: $0.videoGames as? [String] ?? [],
                isFavorite: $0.isFavorite
            )

        }

    }

    func save(characters: [Character]) throws {

        for character in characters {

            let request: NSFetchRequest<CharacterEntity> = CharacterEntity.fetchRequest()
            request.predicate = NSPredicate(format: "id == %d", character.id)

            let existingEntity = try context.fetch(request).first

            let entity = existingEntity ?? CharacterEntity(context: context)

            entity.id = Int64(character.id)
            entity.name = character.name
            entity.imageURL = character.imageURL
            entity.films = character.films as NSArray
            entity.tvShows = character.tvShows as NSArray
            entity.videoGames = character.videoGames as NSArray

            if existingEntity == nil {
                entity.isFavorite = character.isFavorite
            }
        }

        try context.save()
    }

    func updateFavorite(id: Int, isFavorite: Bool) throws {

        let request: NSFetchRequest<CharacterEntity> = CharacterEntity.fetchRequest()

        request.predicate = NSPredicate(format: "id == %d", id)

        if let entity = try context.fetch(request).first {

            entity.isFavorite = isFavorite

            try context.save()

        }

    }
    
    func fetchFavorites() throws -> [Character] {

        let request: NSFetchRequest<CharacterEntity> = CharacterEntity.fetchRequest()

        request.predicate = NSPredicate(format: "isFavorite == YES")

        let entities = try context.fetch(request)

        return entities.map {

            Character(
                id: Int($0.id),
                name: $0.name ?? "",
                imageURL: $0.imageURL ?? "",
                films: $0.films as? [String] ?? [],
                tvShows: $0.tvShows as? [String] ?? [],
                videoGames: $0.videoGames as? [String] ?? [],
                isFavorite: $0.isFavorite
            )

        }

    }
}
