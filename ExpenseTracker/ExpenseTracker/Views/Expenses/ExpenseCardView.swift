//
//  ExpenseCardView.swift
//  ExpenseTracker
//
//  Created by Abhishek Shukla on 16/06/24.
//

import SwiftUI

struct ExpenseCardView: View {
    
    @Bindable var expense: Expense
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(expense.title)
                
                Text(expense.subTitile)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .lineLimit(1)
            
            Spacer(minLength: 5)
            
            /* Currency String */
            Text(expense.currencyString)
                .font(.title3.bold())
        }
    }
}

//#Preview {
//    ExpenseCardView(expense: nil)
//}
