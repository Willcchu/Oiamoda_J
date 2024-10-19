//
//  SideViewContens.swift
//  Oiamoda J
//
//  Created by CHUN CHU on 2024-10-12.
//

import SwiftUI

struct SideViewContents: View {
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        ZStack {
            
            Color.lightgray.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 80) {
                SideMenuTopView()
                
                //Change currency
                Button(action: {
                    //action to change currency
                }) {
                    HStack {
                        Image(systemName: "dollarsign.circle")
                            .imageScale(.large)
                        Text("Change Currency")
                            .font(.headline)
                    }
                    .foregroundColor(.white)
                }
                
                //Change language
                Button(action: {
                    //Action to change language
                    
                }) {
                    HStack{
                        Image(systemName: "globe")
                            .imageScale(.large)
                        Text("Change Language")
                            .font(.headline)
                    }
                    .foregroundStyle(.white)
                }
                
                //Tracking orders
                Button(action: {
                    //Navigate to Order tracking
                }) {
                    HStack  {
                        Image(systemName: "shippingbox")
                            .imageScale(.large)
                        Text("Order Tracking")
                            .font(.headline)
                    }
                    .foregroundStyle(.white)
                }
                
                //Dark mode
                Toggle(isOn: .constant(false)) {
                    HStack{
                        Image(systemName: "moon.stars.fill")
                            .imageScale(.large)
                        Text("Dark Mode")
                            .font(.headline)
                    }
                }
                .foregroundStyle(.white)
                .padding(.trailing, 30)
                
                Spacer()
                
                HStack{
                    
                    Spacer()
                    
                    Text("Developed by: C.C. @2024")
                        .padding([.bottom, .trailing], 15)
                        .font(.caption)
                        .foregroundStyle(.white)
                }
            }
            .padding(.leading, 20)
            .frame( maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    func SideMenuTopView() -> some View {
        VStack {
            HStack {
                Button(action: {
                    presentSideMenu.toggle()
                }, label: {
                    Image(systemName: "arrow.left")
                        .imageScale(.large)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                })
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.leading, 5)
        .padding(.top, 60)
        .padding(.bottom, 30)
    }
}

#Preview {
    SideViewContents(presentSideMenu: .constant(true))
}


