//
//  SignInView.swift
//  Oiamoda J
//
//  Created by CHUN CHU on 2024-11-19.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var isSigningIn = false
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        ZStack{
            Color.bg.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Sign In")
                    .font(Font.custom("PlayfairDisplay-Bold", size: 35))
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.subheadline)
                }
                
                Button(action: signIn) {
                    Text(isSigningIn ? "Signing In..." : "Sign In")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(isSigningIn)
                                
                NavigationLink("Don't have an account? Register", destination: RegisterView())
                    
            }
            
            .padding()
        }
    }

    private func signIn() {
        isSigningIn = true
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            isSigningIn = false
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                errorMessage = ""
                // Navigate to My Account Page
            }
        }
    }
}


#Preview {
    SignInView()
}
