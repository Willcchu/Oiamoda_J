//
//  FavoritesManager.swift
//  Oiamoda J
//
//  Created by CHUN CHU on 2024-10-16.
//

import SwiftUI
import Combine

class FavoritesManager: ObservableObject {
    
    // Shared favorites list
    @Published var favorites: [row] = []
    
    func add(_ item: row) {
        if !favorites.contains(where: { $0.id == item.id }) {
            favorites.append(item)
        }
    }
    
    func remove(_ item: row) {
        favorites.removeAll { $0.id == item.id }
    }
    
    func isFavorite(_ item: row) -> Bool {
        favorites.contains(item)
    }
}
