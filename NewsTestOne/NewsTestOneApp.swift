//
//  NewsTestOneApp.swift
//  NewsTestOne
//
//  Created by Максим Кудрявцев on 18.03.2025.
//

import SwiftUI

@main
struct NewsTestOneApp: App {
    // MARK: - Properties
    @State var path = NavigationPath()
    
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                CustomTabView(path: $path)
                    .ignoresSafeArea(edges: .bottom)
                    .navigationDestination(for: NavigationEnum.self) { pages in
                        switch pages {
                        case .news(let article):
                            DetailNewsView(article: article)
                        }
                    }
            }
        }
    }
}
