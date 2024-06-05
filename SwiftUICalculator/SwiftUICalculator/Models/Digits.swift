//
//  Digits.swift
//  SwiftUICalculator
//
//  Created by Abhishek Shukla on 16/05/24.
//

import Foundation

enum Digits: Int, CaseIterable, CustomStringConvertible {
    case zero, one, two, three, four, five, six, seven, eight, nine
    
    var description: String {
        return "\(self.rawValue)"
    }
}
