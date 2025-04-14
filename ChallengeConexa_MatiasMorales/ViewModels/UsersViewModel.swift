//
//  UsersViewModel.swift
//  ChallengeConexa_MatiasMorales
//
//  Created by Matias Nicolas Morales on 11/04/2025.
//

import Foundation

@MainActor
final class UsersViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    init() {
        Task {
            await fetchUsers()
        }
    }

    func fetchUsers() async {
        isLoading = true
        do {
            users = try await APIService.shared.fetch(from: APIEndpoint.users)
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
