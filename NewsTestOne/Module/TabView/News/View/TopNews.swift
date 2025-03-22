//
//  TopNews.swift
//  NewsTestOne
//
//  Created by Максим Кудрявцев on 19.03.2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct TopNews: View {
    // MARK: - Properties
    var article: Article
    @State var showSafari: Bool = false
    
    // MARK: - Body
    var body: some View {
        LazyVStack(alignment: .leading, spacing: 20) {
            ZStack {
                Rectangle()
                    .frame(height: 130)
                    .foregroundStyle(.secondary.opacity(0.4))
                    .clipShape(.rect(cornerRadius: 15))
                
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
                    .foregroundStyle(.secondary.opacity(0.8))
                
                WebImage(url: article.urlToImage)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 130)
                    .clipShape(.rect(cornerRadius: 15))
            }

                Text(article.title)
                    .titlePreviewText()
                    .lineLimit(2)
                
                Spacer()
                
                Text(article.publishedAt.dateToString())
                    .dateText()
                    .foregroundStyle(.black)
                

            
        }
        .frame(width: 260, height: 260)
        .padding(15)
        .background(.background)
        .clipShape(.rect(cornerRadius: 15))
        .onTapGesture {
            self.showSafari = true
        }
        .sheet(isPresented: $showSafari) {
            SafariView(url: article.url)
        }
    }
}
