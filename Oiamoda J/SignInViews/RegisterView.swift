//
//  RegisterView.swift
//  Oiamoda J
//
//  Created by CHUN CHU on 2024-11-19.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct RegisterView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var errorMessage = ""
    @State private var isRegistering = false

    var body: some View {
        ZStack{
            
            Color.bg.ignoresSafeArea()
            VStack(spacing: 20) {
                Text("Register")
                    .font(Font.custom("PlayfairDisplay-Bold", size: 35))
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Confirm Password", text: $confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.subheadline)
                }
                
                Button(action: register) {
                    Text(isRegistering ? "Registering..." : "Register")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(isRegistering)
                
            }
            .padding()
        }
    }

    private func register() {
        guard password == confirmPassword else {
            errorMessage = "Passwords do not match."
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    self.errorMessage = error.localizedDescription
                    print("Registration Error: \(error.localizedDescription)")
                } else {
                    self.errorMessage = ""
                    print("User registered successfully: \(result?.user.uid ?? "No UID")")
                }
        }
    }
}

#Preview {
    RegisterView()
}
