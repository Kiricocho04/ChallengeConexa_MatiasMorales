//
//  ContentView.swift
//  ChallengeConexa_MatiasMorales
//
//  Created by Matias Nicolas Morales on 11/04/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PostListView()
                .tabItem {
                    Label("Noticias", systemImage: "newspaper")
                }

            UsersListView()
                .tabItem {
                    Label("Usuarios", systemImage: "person.3.fill")
                }
        }
    }
}
