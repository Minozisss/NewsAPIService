//
//  OneArticle.swift
//  NewsTestOne
//
//  Created by Максим Кудрявцев on 18.03.2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct OneArticle: View {
    // MARK: - Properties
    var article: Article
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.background)
            
            VStack(alignment: .leading, spacing: 10) {
                ZStack {
                    Rectangle()
                        .frame(height: 150)
                        .foregroundStyle(.black.opacity(0.2))
                        .clipShape(.rect(cornerRadius: 15))
                    
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                        .foregroundStyle(.gray.opacity(0.8))
                    
                    WebImage(url: article.urlToImage)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 150)
                        .clipShape(.rect(cornerRadius: 15))
                }
                
                VStack(alignment: .leading) {
                    Text(article.title)
                        .titlePreviewText()
                    
                    Spacer()
                    
                    Text(article.publishedAt.dateToString())
                        .dateText()
                }
            }
            .padding()
        }
        .frame(height: 260)
        .clipShape(.rect(cornerRadius: 10))
    }
}
