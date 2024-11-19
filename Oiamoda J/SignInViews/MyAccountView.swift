//
//  MyAccountView.swift
//  Oiamoda J
//
//  Created by CHUN CHU on 2024-11-19.
//

import SwiftUI
import Firebase
import FirebaseAuth


struct MyAccountView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager
    @State private var errorMessage = ""
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        ZStack {
            Color.bg.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("My Account")
                    .font(Font.custom("PlayfairDisplay-Bold", size: 25))
                
                if let user = Auth.auth().currentUser {
                    Text("Welcome, \(user.email ?? "User")")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Button("Sign Out") {
                                authViewModel.signOut()
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.bottom, 40)
                
            }
            .padding()
        }
    }
}

#Preview {
    MyAccountView()
}
