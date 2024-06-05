//
//  CalculatorButton.swift
//  SwiftUICalculator
//
//  Created by Abhishek Shukla on 17/05/24.
//

import SwiftUI

struct CalculatorButton: View {
    
    let buttonType: ButtonType
    @EnvironmentObject private var viewModel: ViewModel
    
    var body: some View {
        Button(buttonType.description) {
            viewModel.performAction(for: buttonType)
        }
        .buttonStyle(CalculatorButtonStyle(size: getButtonSize(), backgroundStyle: getBackgroundColor(), foregroundStyle: getForegroundColor(), isWide: buttonType == .digit(.zero)))
    }
    
    private func getButtonSize() -> CGFloat {
        if buttonType == .digit(.zero) {
            print("zero")
        }
        let screenWidth = UIScreen.main.bounds.width
        let buttonCount: CGFloat = 4
        let spacingCount = buttonCount + 1
        return (screenWidth - (spacingCount * 12)) / buttonCount
    }
    
    private func getBackgroundColor() -> Color {
        return viewModel.buttonTypeIsHighlighted(buttonType: buttonType) ?
        buttonType.foregroundColor: buttonType.backgroundColor
    }
    
    private func getForegroundColor() -> Color {
        return viewModel.buttonTypeIsHighlighted(buttonType: buttonType) ?
        buttonType.backgroundColor: buttonType.foregroundColor
    }
}

struct CalculatorButtonStyle: ButtonStyle {
    var size: CGFloat
    var backgroundStyle: Color
    var foregroundStyle: Color
    var isWide: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 32, weight: .medium))
            .frame(width: size, height: size)
            .frame(maxWidth: isWide ? .infinity : size, alignment: .leading)
            .background(backgroundStyle)
            .foregroundColor(foregroundStyle)
            .overlay {
                if configuration.isPressed {
                    Color(UIColor(white: 1.0, alpha: 0.2))
                }
            }
            .clipShape(Capsule())
    }
}
