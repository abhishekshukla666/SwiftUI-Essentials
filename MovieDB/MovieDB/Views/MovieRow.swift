//
//  MovieRow.swift
//  MovieDB
//
//  Created by Abhishek Shukla on 09/06/24.
//

import SwiftUI

struct MovieRow: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Popular")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(0..<10, id:\.self) { _ in
                        MovieItem()
                            .frame(width: 300)
                            .padding(.trailing, 20)
                    }
                }
            }
            .padding(.leading, 20)
        }
        .padding(.top)
    }
}

#Preview {
    MovieRow()
}
