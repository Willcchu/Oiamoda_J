//
//  FavoritesView.swift
//  Oiamoda J
//
//  Created by CHUN CHU on 2024-10-16.
//

import SwiftUI

struct FavoritesView: View {
    
    // Access shared state
    @EnvironmentObject var favoritesManager: FavoritesManager

    var body: some View {
        ZStack {
            
            Color.bg
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("Likes")
                    .font(.largeTitle)
                    .padding()
                
                if favoritesManager.favorites.isEmpty {
                    Text("No favorites yet")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    ScrollView {
                        VStack(spacing: 10) {
                            ForEach(favoritesManager.favorites) { item in
                                
                                FavoriteRow(item: item)
                                    .padding(.horizontal)
                                
                            }
                        }
                    }
                }
            }
        }
    }
}

struct FavoriteRow: View {
    let item: row
    
    var body: some View {
        
        ZStack {
            Color.white
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.10), radius: 8, x: 2, y: 6)

            HStack {
                Image(item.image)
                    .resizable()
                    .frame(width: 65, height: 90)
                    .cornerRadius(15)
                
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Text(item.price)
                        .font(.subheadline)
                }
                
                Spacer()
            }
            .padding()
        }
        
    }
}

#Preview {
    FavoritesView()
        .environmentObject(FavoritesManager()) // Inject environment object for preview
}
