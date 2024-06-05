//
//  SwiftUIBasicModifier.swift
//  Airbnb
//
//  Created by Abhishek Shukla on 23/05/24.
//

import SwiftUI

struct SwiftUIBasicModifier: View {
    var body: some View {
        Text("")
            .padding()
            .background(.white)
            .clipShape(Circle())
            .padding()
            .background(.black)
            .clipShape(Circle())
            .padding()
            .background(.green)
            .clipShape(Circle())
            .padding()
            .background(.yellow)
            .clipShape(Circle())
            .padding()
            .background(.blue)
            .clipShape(Circle())
            .padding()
            .background(.cyan)
            .clipShape(Circle())
            .padding()
            .background(.orange)
            .clipShape(Circle())
            .padding()
            .background(.pink)
            .clipShape(Circle())
            
    }
}

#Preview {
    SwiftUIBasicModifier()
}
