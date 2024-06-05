//
//  SwiftUIAnimation.swift
//  Airbnb
//
//  Created by Abhishek Shukla on 26/05/24.
//

import SwiftUI

struct SwiftUIAnimation: View {
    
    @State var animationAmount = 1.0
    var body: some View {
        Button("Tap me") {
//            animationAmount += 1
        }
        .padding(30)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(Circle())
        .overlay {
            Circle()
                .stroke(.red, lineWidth: 2)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(.easeIn(duration: 1).repeatForever(autoreverses: false), value: animationAmount)
        }
//        .scaleEffect(animationAmount)
//        .blur(radius: (animationAmount - 1) * 3)
//        .animation(.easeInOut(duration: 1).repeatForever(autoreverses: false), value: animationAmount)
        .onAppear {
            animationAmount = 2
        }
    }
}

#Preview {
    SwiftUIAnimation()
}
