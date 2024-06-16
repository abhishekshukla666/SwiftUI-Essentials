//
//  GroupedExpenses.swift
//  ExpenseTracker
//
//  Created by Abhishek Shukla on 16/06/24.
//

import Foundation

struct GroupedExpenses: Identifiable {
    var id: UUID = .init()
    var date: Date
    var expenses: [Expense]
    
    /* Group Title */
    var groupTitle: String {
        let calendar = Calendar.current
        if calendar.isDateInToday(date) {
            return "Today"
        } else if calendar.isDateInYesterday(date) {
            return "YesterDay"
        } else {
            return date.formatted(date: .abbreviated, time: .omitted)
        }
    }
}
