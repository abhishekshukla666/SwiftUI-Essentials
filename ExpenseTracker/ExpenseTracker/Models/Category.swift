//
//  Category.swift
//  ExpenseTracker
//
//  Created by Abhishek Shukla on 16/06/24.
//

import Foundation
import SwiftData

@Model
class Category {
    
    var name: String
    @Relationship(deleteRule: .cascade, inverse: \Expense.category)
    var expenses: [Expense]?
    
    init(name: String) {
        self.name = name
    }
}
