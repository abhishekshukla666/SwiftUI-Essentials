//
//  SwiftUICalculatorApp.swift
//  SwiftUICalculator
//
//  Created by Abhishek Shukla on 16/05/24.
//

import SwiftUI

@main
struct SwiftUICalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            CalculatorView()
                .environmentObject(ViewModel())
        }
    }
}
