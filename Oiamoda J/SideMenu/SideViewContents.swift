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
            VStack(alignment: .leading, spacing: 0) {
                SideMenuTopView()
                VStack {
                    Text("Side Menu")
                        .foregroundColor(.white)
                }.frame( maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity)
            .background(.lightgray)
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
        .padding(.leading, 40)
        .padding(.top, 70)
        .padding(.bottom, 30)
    }
}
