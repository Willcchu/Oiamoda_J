//
//  CustomTabView.swift
//  Oiamoda J
//
//  Created by CHUN CHU on 2024-10-10.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var tabSelection: Int
    @Namespace private var animationNamespace
    
    let tabBarItems: [(image: String, title: String)] = [
        ("house", "Home"),
        ("heart", "Fav"),
        ("cart", "Shop"),
        ("person", "User")
        
    ]
    
    var body: some View{
        
        ZStack{
            
            Capsule()
                .frame(height: 70)
                .foregroundColor(Color(.secondarySystemBackground))
                .shadow(color: Color.black.opacity(0.20), radius: 8, x: 2, y: 6)
                
            HStack{
                
                ForEach(0..<4) { index in
                    Button{
                        
                        tabSelection = index + 1
                    } label: {
                        VStack(spacing: 8){
                            
                            Spacer()
                            Image(systemName: tabBarItems[index].image)
                                .padding()
                                .imageScale(.large)
                            
                            if index + 1 == tabSelection {
                                Capsule()
                                    .frame(height: 8)
                                    .foregroundColor(.clear)
                                    .matchedGeometryEffect(id: "SelectedTabId", in: animationNamespace)
                                    .offset(y:3)
                                
                            } else {
                                Capsule()
                                    .frame(height: 8)
                                    .foregroundColor(.clear)
                                    .offset(y:3)
                                
                            }
                            
                        }
                        .foregroundColor(index + 1 == tabSelection ? .black : .gray)
                    }
                    
                }
            }.frame(height:80)
                .clipShape(Capsule())
                                        
        }
        .padding(.horizontal)
        
    }
}

struct CustomTabView_Previews: PreviewProvider{
    static var previews: some View{
        CustomTabView(tabSelection: .constant(1))
            .previewLayout(.sizeThatFits)
            .padding(.vertical)
    }
}
