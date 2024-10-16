//
//  HomeView.swift
//  Oiamoda J
//
//  Created by CHUN CHU on 2024-09-20.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        VStack(spacing: 15) {
            TopBarView()
            
            ZStack {
                DetailsScroll()
            }
            .background(Color.bg)
        }
        .padding([.leading, .trailing], 15)
        .background(Color.bg)
    }
}

struct TopBarView: View {
    var body: some View {
        HStack {
            Button(action: {
              
            }) {
                HStack {
                    Text("Casual Dress")
                        .font(.system(size: 17))
                        .foregroundColor(.gray)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .imageScale(.large)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10.0)
            }
            .foregroundColor(.black)

            Button(action: {
                            }) {
                Image(systemName: "slider.vertical.3")
                    .accentColor(.black)
                    .imageScale(.large)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10.0)
            }
        }
    }
}

struct DetailsScroll: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            HorizontalImageScroll()

            SectionHeader(title: "New Arrival")
            
            Image("divider")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 140, height: 10)
                .padding([.top, .bottom], 10)
            
            
            ForEach(datas) { type in
                HStack {
                    ForEach(type.rows) { item in
                        ProductCardView(item: item)
                    }
                }
            }
            
            Image("brands")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top, 20)
        }
    }
}

struct HorizontalImageScroll: View {
    var body: some View {
        TabView {
            // Loop through images with indices from 1 to 4

            ForEach(1...4, id: \.self) { index in
                ZStack {
                    Image("hero\(index)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .frame(height: 480)

                    // Add the "Explore Collection" button over the image
                    ExploreButton()
                        .offset(y: 150)
                }
            }
        }
        // Use page-style TabView to enable the dot indicators
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(height: 480)
    }
}

struct ExploreButton: View {
    var body: some View {
        Button {
            print("Explore Collection Button Clicked")
        } label: {
            RoundedRectangle(cornerRadius: 30).overlay {
                Text("Explore Collection")
                    .font(Font.custom("PlayfairDisplay-Regular", size: 20))
                    .foregroundColor(.white)
            }
            .frame(width: 260, height: 45)
            .tint(.black.opacity(0.6))
        }
    }
}

struct ProductCardView: View {
    let item: row
    
    var body: some View {
        VStack(spacing: 10) {
            Image(item.image)
                .resizable()
                .frame(width: UIScreen.main.bounds.width / 2 - 45, height: 240)
                .cornerRadius(10)
            
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(item.name)
                        .font(.custom("PlayfairDisplay-Regular", size: 20))
                    Text(item.price)
                        .fontWeight(.heavy)
                }
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image(systemName: "heart")
                        .accentColor(.black)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct SectionHeader: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(Font.custom("PlayfairDisplay-Regular", size: 28))
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
            .frame(width: 225, height: 32, alignment: .top)
            .padding(.top, 20)
    }
}


struct type: Identifiable {
    var id: Int
    var rows: [row]
}

struct row: Identifiable {
    var id: Int
    var name: String
    var price: String
    var image: String
}


var datas = [
    type(id: 0, rows: [row(id: 0, name: "ADLV", price: "$199", image: "img1"), row(id: 1, name: "MLB", price: "$159", image: "img2")]),
    type(id: 2, rows: [row(id: 0, name: "Flexi Dress", price: "$199", image: "img3"), row(id: 1, name: "New Arrival", price: "$159", image: "img4")]),
]

#Preview {
    HomeView()
}
