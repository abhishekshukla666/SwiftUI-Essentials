//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Abhishek Shukla on 16/06/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentTab: String = "Expense"
    
    var body: some View {
        TabView(selection: $currentTab) {
            ExpenseView()
            .tag("Expenses")
            .tabItem {
                Label("Expenses", systemImage: "creditcard.fill")
            }
            
            CategoryView()
                .tag("Categories")
                .tabItem {
                    Label("Categories", systemImage: "list.clipboard.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
