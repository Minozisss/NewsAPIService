//
//  NewsViewModel.swift
//  NewsTestOne
//
//  Created by Максим Кудрявцев on 18.03.2025.
//

import Foundation

@Observable
class NewsViewModel {
    // MARK: - Properties
    var topNews: [Article] = []
    var bottomNews: [Article] = []
    var error: Error? = nil
    var isError: Bool = false
    
    // MARK: - Init
    init() {
        fetchTopNews()
        fetchBottomNews()
    }
    
    // MARK: - Methods
    func fetchTopNews() {
        NetworkManager.shared.sendRequest(url: ConstantsURL.businessUSURL, paramet: nil) { [weak self] response in
            switch response {
            case .success(let articles):
                self?.topNews = articles
                self?.error = nil
                self?.isError = false
            case .failure(let error):
                self?.error = error
                self?.isError = true
            }
        }
    }
    
    func fetchBottomNews() {
        NetworkManager.shared.sendRequest(url: ConstantsURL.techCrunchURL, paramet: nil) { [weak self] response in
            switch response {
            case .success(let articles):
                self?.bottomNews = articles
                self?.error = nil
                self?.isError = false
            case .failure(let error):
                self?.error = error
                self?.isError = true
            }
        }
    }
    
}
