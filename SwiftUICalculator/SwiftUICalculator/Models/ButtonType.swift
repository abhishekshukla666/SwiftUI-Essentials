//
//  ButtonType.swift
//  SwiftUICalculator
//
//  Created by Abhishek Shukla on 16/05/24.
//

import Foundation
import SwiftUI

enum ButtonType: Hashable, CustomStringConvertible {
    case digit(_ digit: Digits)
    case operations(_ operations: AirthmeticOperations)
    case allClear
    case negative
    case percent
    case decimal
    case equals
    case clear
    
    var description: String {
        switch self {
        case .digit(let digit): return digit.description
        case .operations(let operations): return operations.description
        case .allClear: return "AC"
        case .negative: return "±"
        case .percent: return "%"
        case .decimal: return "•"
        case .equals: return "="
        case .clear: return "C"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .digit, .decimal: return .secondary
        case .operations, .equals: return .orange
        case .allClear, .clear, .negative, .percent: return Color(.lightGray)
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .clear, .allClear, .negative, .percent: return .black
        default: return .white
        }
    }
}
