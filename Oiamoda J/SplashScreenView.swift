//
//  SplashScreenView.swift
//  Oiamoda J
//
//  Created by CHUN CHU on 2024-09-20.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var isActive = false
    @State private var size = 1.0
    @State private var opacity = 1.0
    
    
    var body: some View {
        
        if isActive{
            ContentView()
        } else{
            
            
            VStack{
                VStack{
                    Image("OiamodaJ")
                        //.resizable()
                        //.scaledToFill()
                        //.ignoresSafeArea()
                        //.offset(x: -18)
                    
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)){
                        
                        self.size = 2.2
                        self.opacity = 0.6
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2){
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
        }
        
        
    }
}

#Preview {
    SplashScreenView()
}
