//
//  BottomNews.swift
//  NewsTestOne
//
//  Created by Максим Кудрявцев on 19.03.2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct BottomNews: View {
    // MARK: - Properties
    var article: Article
    
    // MARK: - Body
    var body: some View {
        LazyVStack(alignment: .leading, spacing: 10) {
            ZStack {
                Rectangle()
                    .frame(height: 130)
                    .foregroundStyle(.gray.opacity(0.4))
                    .clipShape(.rect(cornerRadius: 15))
                
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
                    .foregroundStyle(.gray.opacity(0.8))
                
                WebImage(url: article.urlToImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 130)
                    .clipShape(.rect(cornerRadius: 15))
                
            }
            
            VStack(alignment: .leading) {
                Text(article.title)
                    .titlePreviewText()
                    .lineLimit(3)
                
                Spacer()
                
                Text(article.publishedAt.dateToString())
                    .dateText()
            }
        }
        .frame(width: 120, height: 260)
        .padding(.horizontal, 15)
        .padding(.vertical, 5)
        .background(.background)
        .clipShape(.rect(cornerRadius: 15))
    }
}
