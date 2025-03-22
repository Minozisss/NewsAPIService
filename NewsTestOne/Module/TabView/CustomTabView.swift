//
//  TabView.swift
//  NewsTestOne
//
//  Created by Максим Кудрявцев on 18.03.2025.
//

import SwiftUI

struct CustomTabView: View {
    // MARK: - Properties
    @State var selectTab: String = "newspaper"
    @Binding var path: NavigationPath
    var pages: [[String]] = [["newspaper", "newspaper.fill"], ["magnifyingglass", "magnifyingglass"]]
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectTab) {
                NewsView(path: $path)
                    .tag("newspaper")
                SearchView(path: $path)
                    .tag("magnifyingglass")
            }
            
            HStack(spacing: 20) {
                ForEach(pages, id: \.self) { page in
                    Button {
                        selectTab = page[0]
                    } label: {
                        Image(systemName: selectTab == page[0] ? page[1] : page[0])
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                            .foregroundStyle(selectTab == page[0] ? .blue : .black)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                    }
                }
            }
            .background(
                Rectangle()
                    .frame(width: 200, height: 70)
                    .foregroundStyle(.background)
                    .clipShape(.rect(cornerRadius: 40))
            )
            .padding(.bottom, 50)
            .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 5)
        }
        
        
    }
    
    // MARK: Init
    init(path: Binding<NavigationPath>) {
        self._path = path
        UITabBar.appearance().isHidden = true
    }
}


