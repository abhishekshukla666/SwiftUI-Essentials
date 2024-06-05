//
//  ArcView.swift
//  Airbnb
//
//  Created by Abhishek Shukla on 25/05/24.
//

import SwiftUI

struct Arc: Shape {
    
    let startAngle: Angle
    let endAngle: Angle
    let clockwise: Bool
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: clockwise)
        
        return path
    }
}

struct ArcView: View {
    var body: some View {
        Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
            .stroke(style: StrokeStyle(lineWidth: 4))
            .padding()
    }
}

#Preview {
    ArcView()
}
