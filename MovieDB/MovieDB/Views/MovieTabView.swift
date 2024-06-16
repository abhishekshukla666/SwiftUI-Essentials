//
//  MovieTabView.swift
//  MovieDB
//
//  Created by Abhishek Shukla on 09/06/24.
//

import SwiftUI

struct MovieTabView: View {
    var body: some View {
        TabView {
            MovieListView()
                .tabItem {
                    Label("Movies", systemImage: "list.star")
                }
            MovieSearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}

#Preview {
    MovieTabView()
}
