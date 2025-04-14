//
//  Post.swift
//  ChallengeConexa_MatiasMorales
//
//  Created by Matias Nicolas Morales on 11/04/2025.
//

import Foundation

struct Post: Identifiable, Codable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
