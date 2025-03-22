//
//  FilterButton.swift
//  NewsTestOne
//
//  Created by Максим Кудрявцев on 19.03.2025.
//

import SwiftUI

struct FilterButton: View {
    // MARK: - Properties
    @Binding var whoActive: String
    var title: String
    
    // MARK: - Body
    var body: some View {
        
        Button {
            self.whoActive = title
        } label: {
            Text(title)
                .font(.system(size: 16, weight: .regular))
                .foregroundStyle(.background)
            
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .frame(maxWidth: .infinity)
        .background(whoActive == title ? .blue : .secondary.opacity(0.6))
        .clipShape(.rect(cornerRadius: 20))
    }
    
}
