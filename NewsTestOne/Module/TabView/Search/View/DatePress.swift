//
//  DatePress.swift
//  NewsTestOne
//
//  Created by Максим Кудрявцев on 19.03.2025.
//

import SwiftUI

struct DatePress: View {
    @State private var date = Date()
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2021, month: 1, day: 1)
        let endComponents = DateComponents(year: 2021, month: 12, day: 31)
        return calendar.date(from:startComponents)!
            ...
            calendar.date(from:endComponents)!
    }()


    var body: some View {
        DatePicker(
            "Start Date",
             selection: $date,
             in: dateRange,
             displayedComponents: [.date, .hourAndMinute]
        )
    }
}

#Preview {
    DatePress()
}
