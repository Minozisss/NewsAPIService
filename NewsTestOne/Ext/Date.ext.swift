//
//  Data.ext.swift
//  NewsTestOne
//
//  Created by Максим Кудрявцев on 18.03.2025.
//

import Foundation

extension Date {
    func dateToString() -> String {
        return self.formatted(.dateTime.hour().minute().day().month().year())
    }
    
    func dateToStringRU() -> String {
        return self.formatted(.dateTime.hour().minute().day().month().year().locale(Locale(identifier: "ru")))
    }
}
