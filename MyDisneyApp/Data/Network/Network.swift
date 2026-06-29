//
//  Network.swift
//  MyDisneyApp
//
//  Created by Cinthia Villegas on 28/06/26.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
    case unknown(Error)
}

protocol NetworkServiceProtocol {
    func fetchCharacters() async throws -> [CharacterDTO]
}

final class NetworkService: NetworkServiceProtocol {

    func fetchCharacters() async throws -> [CharacterDTO] {

        guard let url = URL(string: "https://api.disneyapi.dev/character") else {
            throw NetworkError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        print("📦 Datos recibidos:", data.count)

        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }

        do {

            let decoded = try JSONDecoder().decode(CharacterResponseDTO.self, from: data)

            print("✅ Decodificados: \(decoded.data.count)")

            return decoded.data

        } catch {

            print("❌ Error al decodificar:")
            print(error)

            if let json = String(data: data, encoding: .utf8) {
                print(json)
            }

            throw error
        }
    }
}
