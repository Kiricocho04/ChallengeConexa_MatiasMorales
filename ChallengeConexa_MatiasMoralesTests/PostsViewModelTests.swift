//
//  PostsViewModelTests.swift
//  ChallengeConexa_MatiasMoralesTests
//
//  Created by Matias Nicolas Morales on 14/04/2025.
//

import XCTest
@testable import ChallengeConexa_MatiasMorales

final class PostsViewModelTests: XCTestCase {
    func testFetchPostsLoadsData() async {
        // Given
        let viewModel = await PostsViewModel()
        
        // When
        await viewModel.fetchPosts()
        
        // Then
        let posts = await viewModel.posts
        XCTAssertFalse(posts.isEmpty, "La lista de posts no debería estar vacía.")
    }
}

