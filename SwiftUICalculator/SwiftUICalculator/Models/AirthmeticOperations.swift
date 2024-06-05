//
//  AirthmeticOperations.swift
//  SwiftUICalculator
//
//  Created by Abhishek Shukla on 16/05/24.
//

import Foundation

enum AirthmeticOperations: CaseIterable, CustomStringConvertible {
    case addition, sustraction, division, multiplication
    
    var description: String {
        switch self {
        case .addition: return "+"
        case .sustraction: return "-"
        case .division: return "÷"
        case .multiplication: return "×"
        }
    }
}
