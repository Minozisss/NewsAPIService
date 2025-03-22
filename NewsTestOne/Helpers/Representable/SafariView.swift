//
//  SafariRepres.swift
//  NewsTestOne
//
//  Created by Максим Кудрявцев on 19.03.2025.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    // MARK: - Properties
    typealias UIViewControllerType = SFSafariViewController
    let url: URL
    
    // MARK: - Methods
    func makeUIViewController(context: Context) -> UIViewControllerType {
        SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }  
}

