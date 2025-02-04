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
        ZStack {
            // 使用自定义背景色
            Color.bg
                .ignoresSafeArea()
            
            VStack {
                
                // MARK: - Header 区域
                VStack(spacing: 16) {
                    // 头部图标（可替换为品牌logo）
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 80, height: 80)
                        .foregroundColor(.blue)
                    
                    Text("Welcome Back")
                        .font(Font.custom("PlayfairDisplay-Bold", size: 35))
                        .foregroundColor(.primary)
                }
                .padding(.bottom, 30)
                
                // MARK: - 登录表单卡片
                VStack(spacing: 20) {
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                    if !errorMessage.isEmpty {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.subheadline)
                    }
                    
                    Button(action: signIn) {
                        HStack {
                            Spacer()
                            Text(isSigningIn ? "Signing In..." : "Sign In")
                                .font(Font.custom("PlayfairDisplay-Bold", size: 18))
                            Spacer()
                        }
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                    .disabled(isSigningIn)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
                .padding(.horizontal, 20)
                
                Spacer()
                
                // MARK: - 跳转注册页面
                NavigationLink(destination: RegisterView()) {
                    Text("Don't have an account? Register")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                        .underline()
                }
                .padding(.bottom, 30)
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
                // 登录成功后，可在此跳转到主账户页面
            }
        }
    }
}

#Preview {
    NavigationView {
        SignInView()
            .environmentObject(AuthViewModel())
    }
}
