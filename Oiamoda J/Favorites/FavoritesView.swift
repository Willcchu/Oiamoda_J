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
                                
                if favoritesManager.favorites.isEmpty {
                    
                    Image(systemName: "bolt.heart")
                        .resizable()
                        .frame(width: 100, height: 90)
                        .foregroundColor(.gray)
                    
                    Text("Likes")
                        .foregroundColor(.gray)
                        .font(.headline)
                        .padding()
                    
                    Text("It seems you don't have any likes yet :(")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    
                    Image(systemName: "heart.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                        .padding()
                    
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
    @EnvironmentObject var favoritesManager: FavoritesManager
    
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
                
                
                //add a button to unlike the item from fav page
                Button(action: {
                    favoritesManager.remove(item)
                }) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.black)
                        .padding()
                }
            }
            .padding()
        }
        
    }
}

#Preview {
    FavoritesView()
        .environmentObject(FavoritesManager()) // Inject environment object for preview
}
