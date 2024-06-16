//
//  ExpenseView.swift
//  ExpenseTracker
//
//  Created by Abhishek Shukla on 16/06/24.
//

import SwiftUI
import SwiftData

struct ExpenseView: View {
    
    
    @Environment(\.modelContext) private var context
    
    /* Grouped Expenses */
    @Query(sort: [SortDescriptor(\Expense.date, order: .reverse)], animation: .snappy) private var allExpenses: [Expense]

    @State private var groupedExpenses: [GroupedExpenses] = .init()
    @State private var showingAddExpense: Bool = false
    
    var body: some View {
        NavigationStack {
            List{
                ForEach($groupedExpenses) { group in
                    Section(group.groupTitle) {
                        ForEach(group.expenses) { expense in
                            /* Card View */
                            ExpenseCardView(expense: expense)
                                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                    Button {
                                        /* Deleting Data */
                                        context.delete(expense)
                                        withAnimation {
                                            group.expenses.removeAll(where: { $0.id == expense.id })
                                            /* Removing Group, If no expenses present */
                                            if group.expenses.isEmpty {
                                                groupedExpenses.removeAll(where: { $0.id == group.id })
                                            }
                                        }
                                    } label: {
                                        Image(systemName: "trash")
                                    }
                                    .tint(.red)
                                }
                        }
                    }
                }
            }
            .navigationTitle("Expenses")
            .overlay {
                if allExpenses.isEmpty || groupedExpenses.isEmpty {
                    ContentUnavailableView {
                        Label("No Expenses", systemImage: "tray.fill")
                    }
                }
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        showingAddExpense.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .foregroundStyle(.orange)
                    }
                }
            }
        }
        .onChange(of: allExpenses, initial: true) { oldValue, newValue in
            if newValue.count > oldValue.count || groupedExpenses.isEmpty {
                createGroupedExpenses(newValue)
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddExpenseView()
        }
    }
    
    /* Creating Grouped Expenses (Grouping by Date) */
    func createGroupedExpenses(_ expenses: [Expense]) {
        Task.detached(priority: .high) {
            let groupedDict = Dictionary(grouping: expenses) { expense in
                let dateComponets = Calendar.current.dateComponents([.day, .month, .year], from: expense.date)
                return dateComponets
            }
            
            /* Sorting Dictionary in Descending Order */
            let sortedDict = groupedDict.sorted {
                let calendar = Calendar.current
                let date1 = calendar.date(from: $0.key) ?? .init()
                let date2 = calendar.date(from: $1.key) ?? .init()
                
                return calendar.compare(date1, to: date2, toGranularity: .day) == .orderedDescending
            }
            
            /* Adding to the Grouped Expenses Array
             UI Must be Updated on Main Thread
             */
            
            await MainActor.run {
                groupedExpenses = sortedDict.compactMap { dict in
                    let date = Calendar.current.date(from: dict.key) ?? .init()
                    return .init(date: date, expenses: dict.value)
                }
            }
        }
    }
}

#Preview {
    ExpenseView()
}
