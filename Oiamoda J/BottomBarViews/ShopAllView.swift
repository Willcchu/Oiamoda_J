//
//  AllView.swift
//  Oiamoda J
//
//  Created by CHUN CHU on 2024-09-20.
//

import SwiftUI

struct ShopAllView: View {
    var body: some View {
        
        NavigationView{
            ZStack{
                
                Color.bg.ignoresSafeArea()
                
                Grid{
                    
                    GridRow {
                        
                        NavigationLink(destination: Coats_JacketsView()){
                            
                            Text("Coats & Jackets")
                                .frame(maxWidth: 200).accentColor(.black).font(.custom("PlayfairDisplay-Regular", size: 20))

                            Image(systemName: "arrow.forward")
                                .environment(\.symbolVariants, .none).accentColor(.black)
                            
                        }
                        .padding()
                        .background(.white)
                        .cornerRadius(15)
                        .shadow(color: Color.black.opacity(0.10), radius: 8, x: 2, y: 6)
                        
                    }
                    
                    
                    
                    GridRow{
                        
                        Button(action: {
                            
                            
                        }){
                            Text("Hoodies")
                                .frame(maxWidth: 200).accentColor(.black).font(.custom("PlayfairDisplay-Regular", size: 20))
                            Image(systemName: "arrow.forward")
                                .environment(\.symbolVariants, .none).accentColor(.black)
                            
                        }
                        .padding()
                        .background(.white)
                        .cornerRadius(15)
                        .shadow(color: Color.black.opacity(0.10), radius: 8, x: 2, y: 6)
                        
                    }
                    
                    GridRow{
                        Button(action: {
                            
                            
                        }){
                            Text("T-shirts")
                                .frame(maxWidth: 200).accentColor(.black).font(.custom("PlayfairDisplay-Regular", size: 20))
                            Image(systemName: "arrow.forward")
                                .environment(\.symbolVariants, .none).accentColor(.black)
                            
                        }
                        .padding()
                        .background(.white)
                        .cornerRadius(15)
                        .shadow(color: Color.black.opacity(0.10), radius: 8, x: 2, y: 6)
                    }
                    
                    GridRow{
                        
                        Button(action: {
                            
                            
                        }){
                            Text("Pants")
                                .frame(maxWidth: 200).accentColor(.black).font(.custom("PlayfairDisplay-Regular", size: 20))
                            Image(systemName: "arrow.forward")
                                .environment(\.symbolVariants, .none).accentColor(.black)
                            
                        }
                        .padding()
                        .background(.white)
                        .cornerRadius(15)
                        .shadow(color: Color.black.opacity(0.10), radius: 8, x: 2, y: 6)
                        
                    }
                    
                    GridRow{
                        
                        Button(action: {
                            
                            
                            
                        }){
                            Text("Shoes")
                                .frame(maxWidth: 200).accentColor(.black).font(.custom("PlayfairDisplay-Regular", size: 20))
                            Image(systemName: "arrow.forward")
                                .environment(\.symbolVariants, .none).accentColor(.black)
                            
                        }
                        .padding()
                        .background(.white)
                        .cornerRadius(15)
                        .shadow(color: Color.black.opacity(0.10), radius: 8, x: 2, y: 6)
                        
                    }
                    
                    GridRow{
                        
                        Button(action: {
                            
                            
                        }){
                            Text("Bags")
                                .frame(maxWidth: 200).accentColor(.black).font(.custom("PlayfairDisplay-Regular", size: 20))
                            Image(systemName: "arrow.forward")
                                .environment(\.symbolVariants, .none).accentColor(.black)
                            
                        }
                        .padding()
                        .background(.white)
                        .cornerRadius(15)
                        .shadow(color: Color.black.opacity(0.10), radius: 8, x: 2, y: 6)
                        
                    }
                    
                    GridRow{
                        
                        NavigationLink(destination: AccessoriesView()){
                            Text("Accessories")
                                .frame(maxWidth: 200).accentColor(.black).font(.custom("PlayfairDisplay-Regular", size: 20))
                            Image(systemName: "arrow.forward")
                                .environment(\.symbolVariants, .none).accentColor(.black)
                            
                        }
                        .padding()
                        .background(.white)
                        .cornerRadius(15)
                        .shadow(color: Color.black.opacity(0.10), radius: 8, x: 2, y: 6)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    ShopAllView()
}
