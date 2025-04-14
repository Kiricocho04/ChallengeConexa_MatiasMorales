//
//  PostDetailView.swift
//  ChallengeConexa_MatiasMorales
//
//  Created by Matias Nicolas Morales on 11/04/2025.
//

import SwiftUI

struct PostDetailView: View {
    let post: Post

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(post.title.capitalized)
                    .font(.title)
                    .fontWeight(.bold)

                Text(post.body)
                    .font(.body)
                    .foregroundColor(.primary)

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Detalle")
        .navigationBarTitleDisplayMode(.inline)
    }
}
