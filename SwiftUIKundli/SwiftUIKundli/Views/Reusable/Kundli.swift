//
//  Kundli.swift
//  SwiftUIKundli
//
//  Created by Abhishek Shukla on 28/05/24.
//

import SwiftUI

struct Kundli: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Outer Rectangle
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY / 2))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY / 2))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        
        // Diagonal
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY / 2))
        path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY / 2))
        
        // Inner Rectangle
        path.move(to: CGPoint(x: rect.maxX / 2, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY / 4))
        path.addLine(to: CGPoint(x: rect.maxX / 2, y: rect.maxY / 2))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY / 4))
        path.addLine(to: CGPoint(x: rect.maxX / 2, y: rect.minY))
        
        return path
    }
}

#Preview {
    Kundli()
        .stroke(lineWidth: 2)
        .foregroundStyle(.orange)
        .padding()
}
