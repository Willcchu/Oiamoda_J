//
//  BagView.swift
//  Oiamoda J
//
//  Created by CHUN CHU on 2024-09-20.
//

import SwiftUI

struct CartView: View {
    var body: some View {
        ZStack{
            Color("Bg").ignoresSafeArea()
            
            VStack{
                Image(systemName: "cart.badge.plus")
                    .resizable()
                    .frame(width: 100, height: 80)
                    .foregroundColor(.gray)
                
                Text("Empty Bag")
                    .foregroundColor(.gray)
                    .font(.headline)
                    .padding()
                
            }
        }
    }
}

#Preview {
    CartView()
}
