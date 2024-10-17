//
//  Oiamoda_JApp.swift
//  Oiamoda J
//
//  Created by CHUN CHU on 2024-09-20.
//

import SwiftUI

@main
struct Oiamoda_JApp: App {
    @StateObject private var favoritesManager = FavoritesManager()
    
    
    var body: some Scene {
        
        
        WindowGroup {
            SplashScreenView()
                .environmentObject(FavoritesManager())

        }
    }
}


