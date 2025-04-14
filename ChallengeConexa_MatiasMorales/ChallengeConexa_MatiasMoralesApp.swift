//
//  ChallengeConexa_MatiasMoralesApp.swift
//  ChallengeConexa_MatiasMorales
//
//  Created by Matias Nicolas Morales on 11/04/2025.
//

import SwiftUI
import GoogleMaps

@main
struct ChallengeConexa_MatiasMoralesApp: App {
    
    init() {
        GMSServices.provideAPIKey("AIzaSyB10IkwSwcZcctnQG9t8VJ2QCbqahs_Tgk")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
