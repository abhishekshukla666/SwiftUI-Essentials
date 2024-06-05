//
//  Calculator.swift
//  SwiftUICalculator
//
//  Created by Abhishek Shukla on 16/05/24.
//

import Foundation

struct Calculator {
    
    private struct AirthmeticExpression: Equatable {
        
        var number: Decimal
        var operations: AirthmeticOperations
        
        func evaluate(with secondNumber: Decimal) -> Decimal {
            switch operations {
            case .addition:
                return number + secondNumber
            case .sustraction:
                return number - secondNumber
            case .division:
                return number / secondNumber
            case .multiplication:
                return number * secondNumber
            }
        }
    }
    
    private var newNumber: Decimal? {
        didSet {
            guard newNumber != nil else { return }
            carryingNegative = false
            carryingDecimal = false
            pressedClear = false
            carryingZeroCount = 0
        }
    }
    
    private var expression : AirthmeticExpression?
    private var result : Decimal?
    private var carryingNegative: Bool = false
    private var carryingDecimal : Bool = false
    private var carryingZeroCount : Int = 0
    private var pressedClear: Bool = false
    
    var displayText: String{
        return getNumberString(forNumber: number, withCommas: true)
    }
    
    var showAllClear: Bool {
        newNumber == nil && expression == nil && result == nil || pressedClear
    }
    
    var number: Decimal? {
        if pressedClear || carryingDecimal {
            return newNumber
        }
        
        return newNumber ?? expression?.number ?? result
    }
    
    private var containsDecimal: Bool {
        return getNumberString(forNumber: number).contains(".")
    }
    
    mutating func setDigit(_ digit: Digits) {
        if containsDecimal && digit == .zero {
            carryingZeroCount += 1
        } else if canAddDigit(digit) {
            let numberString = getNumberString(forNumber: newNumber)
            newNumber = Decimal(string: numberString.appending("\(digit.rawValue)"))
        }
    }
    
    mutating func setOperation(_ operation: AirthmeticOperations) {
        guard var number = newNumber ?? result else { return }
        if let existingExpression = expression {
            number = existingExpression.evaluate(with: number)
        }
        expression = AirthmeticExpression(number: number, operations: operation)
        newNumber = nil
    }
    
    mutating func toggleSign() {
        if let number = newNumber {
            newNumber = -number
            return
        }
        if let number = result {
            result = -number
            return
        }
        carryingNegative.toggle()
    }
    
    mutating func setPercent() {
        if let number = newNumber {
            newNumber = number / 100
            return
        }
        if let number = result {
            result = number / 100
            return
        }
    }
    
    mutating func setDecimal() {
        if containsDecimal { return }
        carryingDecimal = true
    }
    
    mutating func evaluate() {
        guard let number = newNumber, let expressionToEvaluate = expression else { return }
        result = expressionToEvaluate.evaluate(with: number)
        expression = nil
        newNumber = nil
    }
    
    mutating func allClear() {
        newNumber = nil
        expression = nil
        result = nil
        carryingNegative = false
        carryingDecimal = false
        carryingZeroCount = 0
    }
    
    mutating func clear() {
        newNumber = nil
        carryingNegative = false
        carryingDecimal = false
        carryingZeroCount = 0
        pressedClear = true
    }
    
    func operationIsHighlighted(_ operation: AirthmeticOperations) -> Bool {
        return expression?.operations == operation && newNumber == nil
    }
    
    private func getNumberString(forNumber number : Decimal?, withCommas: Bool = false) -> String {
        var numberString = (withCommas ? number?.formatted(.number): number.map(String.init)) ?? "0"
        
        if carryingNegative {
            numberString.insert("-", at: numberString.startIndex)
        }
        
        if carryingDecimal {
            numberString.insert(".", at: numberString.endIndex)
        }
        if carryingZeroCount > 0 {
            numberString.append(String(repeating: "0", count: carryingZeroCount))
        }
        
        return numberString
    }
    
    private func canAddDigit(_ digit: Digits) -> Bool {
        return number != nil || digit != .zero
    }
    
}
