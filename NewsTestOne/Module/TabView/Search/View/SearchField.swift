//
//  SearchField.swift
//  NewsTestOne
//
//  Created by Максим Кудрявцев on 19.03.2025.
//

import SwiftUI

struct SearchField: View {
    // MARK: - Properties
    @Binding var textForSearch: String
    
    // MARK: - Body
    var body: some View {
        TextField(text: $textForSearch) {
                Text("Search")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.background)
        .clipShape(.rect(cornerRadius: 20))
    }
}
