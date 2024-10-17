//
//  ContentView.swift
//  Oiamoda J
//
//  Created by CHUN CHU on 2024-09-19.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection = 1
    @State var presentSideMenu = false
    @StateObject private var favoritesManager = FavoritesManager()
    
    var body: some View {
        
        NavigationView{
            ZStack{
                VStack {
                    
                    ZStack{
                        
                        
                        //title
                        
                        
                        Text("Oiamoda J").font(.custom("PlayfairDisplay-Bold", size: 30))
                        
                        
                        
                        // top bars
                        
                        
                        HStack(spacing: 16) {
                            
                            Button {
                                
                                presentSideMenu.toggle()
                                
                            } label: {
                                
                                Image("Menu").renderingMode(.original)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10.0)
                                
                            }
                            Spacer()
                            
                            
                            NavigationLink(destination: CartView()){
                                
                                Image(systemName: "bag").renderingMode(.original)
                                    .accentColor(.black)
                                    .imageScale(.large)
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10.0)
                            }
                            
                            
                            
                        }
                        
                        
                        // change background color and
                        //padding the buttons
                    }.background(Color.bg)
                        .padding([.leading, .trailing], 15)
                    
                    
                    TabView(selection: $tabSelection){
                        
                        HomeView()
                            .tag(1)
                        
                        FavoritesView()
                            .tag(2)
                        
                        ShopAllView()
                            .tag(3)
                        
                        AccountView()
                            .tag(4)
                        
                    }
                    .overlay(alignment: .bottom){
                        CustomTabView(tabSelection: $tabSelection)
                    }
                    
                }
                .background(Color.bg)
                
                SideMenu()
            }
        }.ignoresSafeArea(.all, edges: .bottom)
            .accentColor(.black)
        
        
    }
    
    @ViewBuilder
    private func SideMenu() -> some View {
        
        SideMenuView(isShowing: $presentSideMenu, direction: .leading) {
            
            SideViewContents(presentSideMenu: $presentSideMenu)
                .frame(width: 300)
        }
        
    }
    
}

#Preview {
    ContentView()
        .environmentObject(FavoritesManager())
}


