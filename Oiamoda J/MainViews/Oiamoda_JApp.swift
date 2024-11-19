//
//  Oiamoda_JApp.swift
//  Oiamoda J
//
//  Created by CHUN CHU on 2024-09-20.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseAuth

@main
struct Oiamoda_JApp: App {
    @StateObject private var favoritesManager = FavoritesManager()
    
    init() {
        FirebaseApp.configure() 
    }
    
    var body: some Scene {
        
        
        WindowGroup {
            SplashScreenView()
                .environmentObject(FavoritesManager())

        }
    }
}


