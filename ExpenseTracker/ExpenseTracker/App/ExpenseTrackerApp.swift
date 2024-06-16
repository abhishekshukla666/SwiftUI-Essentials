//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Abhishek Shukla on 16/06/24.
//

import SwiftUI
import SwiftData

@main
struct ExpenseTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        /* Setup Container */
        .modelContainer(for: [Expense.self, Category.self])
    }
}
