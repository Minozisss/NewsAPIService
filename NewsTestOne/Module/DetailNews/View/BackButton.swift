//
//  BackButton.swift
//  NewsTestOne
//
//  Created by Максим Кудрявцев on 18.03.2025.
//

import SwiftUI

struct BackButton: View {
    // MARK: - Properties
    @Environment(\.dismiss) var dismiss
    
    //MARK: - Body
    var body: some View {
        Button {
            self.dismiss()
        } label: {
            ZStack {
                Circle()
                    .frame(width: 30)
                    .foregroundStyle(.gray.opacity(0.8))
                
                Image(systemName: "chevron.left")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 15)
                    .foregroundStyle(.background.opacity(0.8))
            }
        }
    }
}

#Preview {
    BackButton()
}
