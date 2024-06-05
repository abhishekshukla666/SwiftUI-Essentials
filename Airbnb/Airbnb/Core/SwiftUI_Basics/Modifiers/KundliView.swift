//
//  KundliView.swift
//  Airbnb
//
//  Created by Abhishek Shukla on 24/05/24.
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

struct Planet {
    let id: UUID
    let name: String
    let degree: Double
}

struct KundliHouse {
    let id: UUID
    let number: Int
    let planets: [Planet]
}

struct KundliView: View {
    var body: some View {
        
        ZStack {
            Kundli()
            .stroke(lineWidth: 2)
            .foregroundStyle(.orange)
            .padding()
            
            HouseNumber(number: 1, offsetX: 0, offsetY: -220)
            HouseNumber(number: 2, offsetX: -90, offsetY: -300)
            HouseNumber(number: 3, offsetX: -120, offsetY: -270)
            HouseNumber(number: 4, offsetX: -40, offsetY: -180)
            HouseNumber(number: 5, offsetX: -120, offsetY: -90)
            HouseNumber(number: 6, offsetX: -90, offsetY: -60)
            HouseNumber(number: 7, offsetX: 0, offsetY: -140)
            HouseNumber(number: 8, offsetX: 90, offsetY: -60)
            HouseNumber(number: 9, offsetX: 120, offsetY: -90)
            HouseNumber(number: 10, offsetX: 40, offsetY: -180)
            HouseNumber(number: 11, offsetX: 120, offsetY: -270)
            HouseNumber(number: 12, offsetX: 90, offsetY: -300)

        }
    }
}

#Preview {
    KundliView()
}

struct HouseNumber: View {
    
    var number: Int
    var offsetX: CGFloat
    var offsetY: CGFloat
    
    var body: some View {
        Text("\(number)")
            .offset(x: offsetX, y: offsetY)
            .font(.headline)
    }
}
