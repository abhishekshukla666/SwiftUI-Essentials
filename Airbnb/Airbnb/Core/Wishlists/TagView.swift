//
//  TagView.swift
//  Airbnb
//
//  Created by Abhishek Shukla on 20/06/24.
//

import SwiftUI

struct TagView: View {
    
    @State private var tags: [String] = [
        "SwiftUI", "Swift", "iOS", "Apple", "Xcode", "WWDC", "Android", "React", "Flutter", 
        "Application", "Indie", "Developer", "Objective-C", "C#", "C", "C++", "Java", "iPhone",
        "Apple Watch", "iPad", "MacBook", "iPadOS", "macOS", "visionOS"
    ]
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                Tagslayout(alignment: .center, spacing: 10) {
                    ForEach(tags, id:\.self) { tag in
                        HStack(spacing: 10) {
                            Text(tag)
                                .font(.callout)
                                .fontWeight(.semibold)
                            
                        }
                        .frame(height: 35)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 15)
                        .background {
                            Capsule()
                                .fill(.green.gradient)
                        }
                    }
                }
                .padding(.horizontal, 15)
            }
        }
    }
}

#Preview {
    TagView()
}
