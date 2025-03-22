//
//  Text.ext.swift
//  NewsTestOne
//
//  Created by Максим Кудрявцев on 18.03.2025.
//

import SwiftUI

extension Text {
    func titlePreviewText() -> some View {
        self
            .modifier(TitleTextPreviewModifier())
    }
    
    func titleText() -> some View {
        self
            .modifier(TitleTextModifier())
    }
    
    func descriptionText() -> some View {
        self
            .modifier(DescriptionTextModifier())
    }
    
    func dateText() -> some View {
        self
            .modifier(DateTextModifier())
    }
}

struct TitleTextPreviewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16, weight: .medium))
            .foregroundStyle(.text)
    }
}

struct TitleTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 22, weight: .medium))
            .foregroundStyle(.text)
    }
}

struct DescriptionTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14, weight: .regular))
            .foregroundStyle(.text)
    }
}

struct DateTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12, weight: .regular))
            .foregroundStyle(.gray.opacity(0.8))
    }
}
