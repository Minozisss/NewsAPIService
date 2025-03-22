//
//  NewsViewModel.swift
//  NewsTestOne
//
//  Created by Максим Кудрявцев on 18.03.2025.
//

import Foundation

@Observable
class SearchViewModel {
    // MARK: - Properties
    var news: [Article] = []
    var promt: String = ""
    var sort: String = "relevancy"
    var error: Error? = nil
    var showAlert: Bool = false
    
    // MARK: - Init

    
    // MARK: - Methods
    // Передаём наш промт во ViewModel
    func setPromt(_ text: String) {
        self.promt = text
    }
    
    func setSort(_ sort: String) {
        self.sort = sort
    }
    
    func fetchNews() {
        // Настраиваем параметры и передаём туда наш промт, который предыдущей функцией пришёл сюда
        let param = NetworkManager.shared.setParam(promt: promt, sort: sort)
        
        NetworkManager.shared.sendRequest(url: ConstantsURL.basicURL, paramet: param) { response in
            switch response {
            case .success(let articles):
                self.news = articles
                self.error = nil
                self.showAlert = false
            case .failure(let error):
                self.error = error
                self.showAlert = true
            }
            
        }
    }
}
