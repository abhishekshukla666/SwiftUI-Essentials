//
//  WeatherTabView.swift
//  WeatherApp
//
//  Created by Abhishek Shukla on 25/08/24.
//

import SwiftUI

enum Screen: Hashable, Identifiable, CaseIterable {
    case one
    case two
    case three
    case four
    case five
    
    var id: Screen { self }
}

extension Screen {
    
    @ViewBuilder
    var label: some View {
        switch self {
        
        case .one: Label("One", systemImage: "1.circle")
        case .two: Label("Tow", systemImage: "2.circle")
        case .three: Label("Three", systemImage: "3.circle")
        case .four: Label("Four", systemImage: "4.circle")
        case .five: Label("Five", systemImage: "5.circle")
            
        }
    }
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .one: ContentView()
        case .two: Text("2")
        case .three: Text("3")
        case .four: Text("4")
        case .five: Text("5")
        }
    }
}

struct AppTabView: View {
    @Binding var selection: Screen
    var body: some View {
        TabView(selection: $selection) {
            ForEach(Screen.allCases) { screen in
                screen.destination
                    .tag(screen)
                    .tabItem { screen.label }
            }
        }
        .tint(.orange)
        .toolbarBackground(.indigo, for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
        .onAppear {
            UITableView.appearance().backgroundColor = .magenta
            UITabBar.appearance().unselectedItemTintColor = .gray
        }
    }
}

struct WeatherTabView: View {
    @Binding var selection: Screen
    var body: some View {
        AppTabView(selection: $selection)
        .tint(.orange)
        .toolbarBackground(.indigo, for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
        .onAppear {
            UITableView.appearance().backgroundColor = .magenta
            UITabBar.appearance().unselectedItemTintColor = .gray
        }
    }
}

#Preview {
    WeatherTabView(selection: .constant(.three))
}


struct Restaurant: Identifiable {
    let id = UUID()
    let name: String
}

// A view that shows the data for one Restaurant.
struct RestaurantRow: View {
    var restaurant: Restaurant

    var body: some View {
        Text("Come and eat at \(restaurant.name)")
    }
}

// Create three restaurants, then show them in a list.
struct ContentView: View {
    let restaurants = [
        Restaurant(name: "Joe's Original"),
        Restaurant(name: "The Real Joe's Original"),
        Restaurant(name: "Original Joe's")
    ]

    var body: some View {
        List(restaurants) { restaurant in
            RestaurantRow(restaurant: restaurant)
        }
    }
}
