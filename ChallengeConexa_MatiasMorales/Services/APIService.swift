//
//  APIService.swift
//  ChallengeConexa_MatiasMorales
//
//  Created by Matias Nicolas Morales on 11/04/2025.
//

import Foundation

enum APIEndpoint {
    static let posts = "https://jsonplaceholder.typicode.com/posts"
    static let users = "https://jsonplaceholder.typicode.com/users"
}

final class APIService {
    static let shared = APIService()
    private init() {}

    func fetch<T: Decodable>(from urlString: String) async throws -> [T] {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode([T].self, from: data)
    }
}
