//
//  CalculatorViewModel.swift
//  SwiftUICalculator
//
//  Created by Abhishek Shukla on 17/05/24.
//

import Foundation
import Combine

final class ViewModel: ObservableObject {
    @Published private var calculator = Calculator()
    
    var displayText: String {
        return calculator.displayText
    }
    
    var buttonTypes: [[ButtonType]] {
        let clearType: ButtonType = calculator.showAllClear ? .allClear: .clear
        return [
            [clearType, .negative, .percent, .operations(.division)],
            [.digit(.seven), .digit(.eight), .digit(.nine), .operations(.multiplication)],
            [.digit(.four), .digit(.five), .digit(.six), .operations(.sustraction)],
            [.digit(.one), .digit(.two), .digit(.three), .operations(.addition)],
            [.digit(.zero), .decimal, .equals]
        ]
    }
    
    func performAction(for buttonType: ButtonType) {
        switch buttonType {
            
        case .digit(let digit):
            calculator.setDigit(digit)
        case .operations(let operation):
            calculator.setOperation(operation)
        case .allClear:
            calculator.allClear()
        case .negative:
            calculator.toggleSign()
        case .percent:
            calculator.setPercent()
        case .decimal:
            calculator.setDecimal()
        case .equals:
            calculator.evaluate()
        case .clear:
            calculator.clear()
        }
    }
    
    func buttonTypeIsHighlighted(buttonType: ButtonType) -> Bool {
        guard case .operations(let operation) = buttonType else { return false }
        return calculator.operationIsHighlighted(operation)
    }
}
