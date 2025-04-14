//
//  UsersViewModelTests.swift
//  ChallengeConexa_MatiasMoralesTests
//
//  Created by Matias Nicolas Morales on 14/04/2025.
//

import XCTest
@testable import ChallengeConexa_MatiasMorales

final class UsersViewModelTests: XCTestCase {
    func testFetchUsersLoadsData() async {
        // Given
        let viewModel = await UsersViewModel()
        
        // When
        await viewModel.fetchUsers()
        
        // Then
        let users = await viewModel.users
        XCTAssertFalse(users.isEmpty, "La lista de usuarios no debería estar vacía.")
    }
}

