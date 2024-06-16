//
//  MovieListView.swift
//  MovieDB
//
//  Created by Abhishek Shukla on 09/06/24.
//

import SwiftUI

struct MovieListView: View {
    
    let rows: [GridItem] = {
        [
            GridItem(size: )
        ]
    }()
    var body: some View {
        
        
        NavigationStack {
            List {
                ForEach(0..<3, id:\.self) { _ in
                    MovieRow()
                        .listRowInsets(EdgeInsets())
                    Divider()
                        .background(.gray)
                }
                
            }
            .navigationTitle("Movies")
        }
    }
}

#Preview {
    MovieListView()
}
