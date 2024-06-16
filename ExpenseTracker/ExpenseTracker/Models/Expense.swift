//
//  Expense.swift
//  ExpenseTracker
//
//  Created by Abhishek Shukla on 16/06/24.
//

import Foundation
import SwiftData

@Model
class Expense {
    var title: String
    var subTitile: String
    var amount: Double
    var date: Date
    var category: Category?
    
    init(title: String, subTitile: String, amount: Double, date: Date, category: Category?) {
        self.title = title
        self.subTitile = subTitile
        self.amount = amount
        self.date = date
        self.category = category
    }
    
    /* Currency String */
    /* Transient macro is used to avoid storing properties on disk */
    @Transient
    var currencyString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        return formatter.string(for: amount) ?? ""
    }
}
