//
//  User.swift
//  ChallengeConexa_MatiasMorales
//
//  Created by Matias Nicolas Morales on 11/04/2025.
//

import Foundation

struct User: Identifiable, Decodable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
    let website: String
    let company: Company
}

struct Address: Decodable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}

struct Geo: Decodable {
    let lat: Double
    let lng: Double

    enum CodingKeys: String, CodingKey {
        case lat, lng
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let latString = try container.decode(String.self, forKey: .lat)
        let lngString = try container.decode(String.self, forKey: .lng)

        guard let lat = Double(latString),
              let lng = Double(lngString) else {
            throw DecodingError.dataCorruptedError(forKey: .lat, in: container, debugDescription: "lat/lng should be valid Double")
        }

        self.lat = lat
        self.lng = lng
    }
}

struct Company: Decodable {
    let name: String
    let catchPhrase: String
    let bs: String
}
