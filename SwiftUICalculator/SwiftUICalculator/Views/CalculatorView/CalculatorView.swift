//
//  CalculatorView.swift
//  SwiftUICalculator
//
//  Created by Abhishek Shukla on 16/05/24.
//

import SwiftUI

struct CalculatorView: View {
    
    @EnvironmentObject private var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Spacer()
            displayText
            buttonPad
        }
        .padding(12)
        .background(Color.black)
    }
}

extension CalculatorView {
    private var displayText: some View {
        Text(viewModel.displayText)
            .padding()
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .font(.system(size: 88, weight: .light))
            .lineLimit(1)
            .minimumScaleFactor(0.2)
    }
    
    private var buttonPad: some View {
        VStack(spacing: 12) {
            ForEach(viewModel.buttonTypes, id: \.self) { row in
                HStack(spacing: 12) {
                    ForEach(row, id: \.self) { buttonType in
                            CalculatorButton(buttonType: buttonType)
                    }
                }
            }
        }
    }
}

#Preview {
    CalculatorView()
        .environmentObject(ViewModel())
}
