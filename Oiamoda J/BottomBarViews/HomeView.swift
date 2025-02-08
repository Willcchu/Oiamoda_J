//
//  HomeView.swift
//  Oiamoda J
//
//  Created by CHUN CHU on 2024-09-20.
//

import SwiftUI
import Firebase
import FirebaseAuth

// MARK: - HomeView
struct HomeView: View {
    
    // Access shared manager
    @EnvironmentObject var favoritesManager: FavoritesManager
    
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

// MARK: - TopBarView（增加功能性：分类选择 & 筛选）
struct TopBarView: View {
    @State private var selectedCategory: String = "Casual Dress"
    
    var body: some View {
        HStack(spacing: 15) {
            // 分类下拉菜单，与原来的按钮样式、宽度一致
            Menu {
                Button("Casual Dress") { selectedCategory = "Casual Dress" }
                Button("Formal Wear") { selectedCategory = "Formal Wear" }
                Button("Sportswear") { selectedCategory = "Sportswear" }
                Button("Accessories") { selectedCategory = "Accessories" }
            } label: {
                HStack {
                    Text(selectedCategory)
                        .font(.system(size: 17))
                        .foregroundColor(.gray)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .imageScale(.large)
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10.0)
            }
            .foregroundColor(.black)
            
            // 筛选下拉菜单，与原来的筛选按钮排布和尺寸保持一致
            Menu {
                Button("Price: Low to High") { /* 添加筛选逻辑 */ }
                Button("Price: High to Low") { /* 添加筛选逻辑 */ }
                Button("Newest Arrivals") { /* 添加筛选逻辑 */ }
            } label: {
                HStack {
                    Image(systemName: "slider.vertical.3")
                        .imageScale(.large)
                        .foregroundColor(.black)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10.0)
            }
        }
    }
}



// 分类选择弹窗
struct CategorySelectionView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedCategory: String
    let categories: [String] = ["Casual Dress", "Formal Wear", "Sportswear", "Accessories"]
    
    var body: some View {
        NavigationView {
            List(categories, id: \.self) { category in
                Button(action: {
                    selectedCategory = category
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text(category)
                }
            }
            .navigationTitle("Select Category")
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

// 筛选弹窗
struct FilterView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            List {
                Text("Filter Option 1")
                Text("Filter Option 2")
            }
            .navigationTitle("Filters")
            .navigationBarItems(trailing: Button("Done") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

// MARK: - DetailsScroll
struct DetailsScroll: View {
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    // 使用两列网格保证产品卡整齐排列
    let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            HorizontalImageScroll()
            
            SectionHeader(title: "New Arrival")
            
            Image("divider")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 140, height: 10)
                .padding([.top, .bottom], 10)
            
            // 使用 LazyVGrid 显示产品卡，并用 NavigationLink 包裹每个产品卡
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(datas.flatMap { $0.rows }) { item in
                    NavigationLink(
                        destination: ProductDetailView(product: item)
                            .environmentObject(favoritesManager)
                    ) {
                        ProductCardView(item: item)
                            .environmentObject(favoritesManager)
                    }
                }
            }
            .padding(.bottom, 20)
            
            Image("brands")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top, 20)
        }
    }
}

// MARK: - HorizontalImageScroll
struct HorizontalImageScroll: View {
    var body: some View {
        TabView {
            // 循环展示 hero 图片
            ForEach(1...4, id: \.self) { index in
                ZStack {
                    Image("hero\(index)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .frame(height: 480)
                    
                    // 在图片上添加 “Explore Collection” 按钮
                    ExploreButton()
                        .offset(y: 150)
                }
            }
        }
        // 使用 page 样式显示 dot 指示器
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(height: 480)
    }
}

// “Explore Collection” 按钮
struct ExploreButton: View {
    var body: some View {
        Button {
            print("Explore Collection Button Clicked")
        } label: {
            RoundedRectangle(cornerRadius: 30)
                .overlay {
                    Text("Explore Collection")
                        .font(Font.custom("PlayfairDisplay-Regular", size: 20))
                        .foregroundColor(.white)
                }
                .frame(width: 260, height: 45)
                .tint(.black.opacity(0.6))
        }
    }
}

// MARK: - ProductCardView（删除名称，重新布局）
struct ProductCardView: View {
    let item: row
    
    // 共享状态
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    var body: some View {
        VStack(spacing: 10) {
            ZStack(alignment: .topTrailing) {
                Image(item.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width / 2 - 45)
                    .cornerRadius(10)
                
                Button(action: {
                    addToFavorites(item)
                }) {
                    Image(systemName: favoritesManager.isFavorite(item) ? "heart.fill" : "heart")
                        .foregroundColor(.red)
                        .padding(8)
                        .background(Color.white.opacity(0.7))
                        .clipShape(Circle())
                }
                .padding(8)
            }
            
            // 只显示价格（删除了产品名称）
            Text(item.price)
                .font(Font.custom("PlayfairDisplay-Regular", size: 20))
                .fontWeight(.heavy)
                .foregroundColor(.black)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
    
    // 添加或移除收藏逻辑
    private func addToFavorites(_ item: row) {
        if favoritesManager.isFavorite(item) {
            favoritesManager.remove(item)
        } else {
            favoritesManager.add(item)
        }
    }
}

// MARK: - SectionHeader
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

// MARK: - 数据模型及示例数据
struct type: Identifiable {
    var id: Int
    var rows: [row]
}

struct row: Identifiable, Equatable {
    var id: Int
    var name: String
    var price: String
    var image: String
}

var datas = [
    type(id: 0, rows: [
        row(id: 0, name: "ADLV", price: "From $199", image: "img1"),
        row(id: 1, name: "MLB", price: "From $159", image: "img2")
    ]),
    type(id: 2, rows: [
        row(id: 2, name: "Flexi Dress", price: "From $199", image: "img3"),
        row(id: 3, name: "New Arrival", price: "From $159", image: "img4")
    ]),
]

// MARK: - 预览
#Preview {
    HomeView()
        .environmentObject(FavoritesManager())
}
