//
//  PostsViewModel.swift
//  ChallengeConexa_MatiasMorales
//
//  Created by Matias Nicolas Morales on 11/04/2025.
//

import Foundation

@MainActor
final class PostsViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var filteredPosts: [Post] = []
    @Published var searchText: String = ""
    @Published var isLoading = false
    @Published var errorMessage: String?

    init() {
        Task {
            await fetchPosts()
        }
    }

    func fetchPosts() async {
        isLoading = true
        do {
            let fetched: [Post] = try await APIService.shared.fetch(from: APIEndpoint.posts)
            posts = fetched
            filteredPosts = fetched
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }

    func filterPosts() {
        guard !searchText.isEmpty else {
            filteredPosts = posts
            return
        }

        filteredPosts = posts.filter {
            $0.title.localizedCaseInsensitiveContains(searchText) ||
            $0.body.localizedCaseInsensitiveContains(searchText)
        }
    }
}
