//
//  DetailNewsView.swift
//  NewsTestOne
//
//  Created by Максим Кудрявцев on 18.03.2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailNewsView: View {
    // MARK: - Properties
    var article: Article
    @State var isSafariShow: Bool = false
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                BackButton()
                ZStack {
                    Rectangle()
                        .frame(height: 250)
                        .foregroundStyle(.secondary.opacity(0.4))
                    
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 80)
                        .foregroundStyle(.secondary.opacity(0.8))
                    
                    WebImage(url: article.urlToImage)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 250)
                        .frame(maxWidth: UIScreen.main.bounds.size.width - 40)
                }
                .clipShape(.rect(cornerRadius: 15))
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(article.title)
                        .titleText()
                    
                    if let desc = article.description {
                        Text(desc)
                            .descriptionText()
                    }
                    
                    Text(article.publishedAt.dateToString())
                        .dateText()
                }
                
                Button {
                    self.isSafariShow = true
                } label: {
                    Text("Read more")
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(.background)
                        .background(.green)
                        .clipShape(.rect(cornerRadius: 20))
                }

                
            }
            .padding(.top, 20)
        }
        .padding(20)
        .background(.secondary.opacity(0.2))
        .ignoresSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $isSafariShow) {
            SafariView(url: article.url)
        }
    }
}


