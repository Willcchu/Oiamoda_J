//
//  ProductDetailView.swift
//  Oiamoda J
//
//  Created by CHUN CHU on 2025-02-08.
//

import SwiftUI

struct ProductDetailView: View {
    let product: row
    @EnvironmentObject var favoritesManager: FavoritesManager

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // 与主页面相同风格的产品卡（Header部分）
                ProductCardView(item: product)
                    .environmentObject(favoritesManager)
                
                // 产品详细信息
                VStack(alignment: .leading, spacing: 10) {
                    Text(product.name)
                        .font(Font.custom("PlayfairDisplay-Bold", size: 24))
                        .foregroundColor(.black)
                    Text("Price: \(product.price)")
                        .font(Font.custom("PlayfairDisplay-Regular", size: 20))
                        .foregroundColor(.gray)
                    Text("This is a detailed description of \(product.name). Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vel purus at lorem maximus varius. You can add more details about the product here, such as material, fit, care instructions, etc.")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineLimit(nil)
                }
                .padding(.horizontal)
                
                // 相关产品区域
                Text("Related Products")
                    .font(Font.custom("PlayfairDisplay-Bold", size: 22))
                    .padding(.horizontal)
                
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 15),
                    GridItem(.flexible(), spacing: 15)
                ], spacing: 15) {
                    ForEach(relatedProducts(), id: \.id) { related in
                        // 这里重用 ProductCardView 显示相关产品
                        ProductCardView(item: related)
                            .environmentObject(favoritesManager)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .navigationTitle(product.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    /// 简单示例：将所有产品中除去当前产品作为相关产品返回
    private func relatedProducts() -> [row] {
         let allProducts = datas.flatMap { $0.rows }
         return allProducts.filter { $0.id != product.id }
    }
}
