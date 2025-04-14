//
//  PostListView.swift
//  ChallengeConexa_MatiasMorales
//
//  Created by Matias Nicolas Morales on 11/04/2025.
//

import SwiftUI

struct PostListView: View {
    @StateObject private var viewModel = PostsViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Cargando...")
                } else if let error = viewModel.errorMessage {
                    Text("Error: \(error)")
                } else {
                    List(viewModel.filteredPosts) { post in
                        NavigationLink(destination: PostDetailView(post: post)) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(post.title.capitalized)
                                    .font(.headline)
                                Text(post.body)
                                    .font(.subheadline)
                                    .lineLimit(2)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationTitle("Noticias")
            .searchable(text: $viewModel.searchText)
            .onChange(of: viewModel.searchText) { _ in
                viewModel.filterPosts()
            }
        }
    }
}

