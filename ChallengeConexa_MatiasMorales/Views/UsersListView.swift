//
//  UsersListView.swift
//  ChallengeConexa_MatiasMorales
//
//  Created by Matias Nicolas Morales on 11/04/2025.
//

import SwiftUI

struct UsersListView: View {
    @StateObject var viewModel = UsersViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.users) { user in
                NavigationLink(destination: UserMapView(user: user)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(user.name)
                            Text(user.email)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Image(systemName: "map")
                            .foregroundColor(.blue)
                    }
                }
            }
            .navigationTitle("Usuarios")
        }
    }
}
