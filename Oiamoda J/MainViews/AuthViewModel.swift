//
//  AuthViewModel.swift
//  Oiamoda J
//
//  Created by CHUN CHU on 2024-11-19.
//

import SwiftUI
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var isSignedIn: Bool = false
    
    init() {
        self.isSignedIn = Auth.auth().currentUser != nil
        self.addAuthStateListener()
    }
    
    private func addAuthStateListener() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            self?.isSignedIn = user != nil
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.isSignedIn = false
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}

