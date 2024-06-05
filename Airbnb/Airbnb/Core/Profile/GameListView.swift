//
//  GameListView.swift
//  Airbnb
//
//  Created by Abhishek Shukla on 07/05/24.
//

import SwiftUI

struct GameListView: View {
    
    let platforms: [Platform] = [.init(name: "Xbox", image: "xbox.logo", color: .green),
                                 .init(name: "Playstation", image: "playstation.logo", color: .indigo),
                                 .init(name: "PC", image: "pc", color: .pink),
                                 .init(name: "Mobile", image: "iphone", color: .mint)
                                 ]
    
    let games: [Game] = [.init(name: "Minecraft", rating: "98"),
                         .init(name: "Game of war", rating: "99"),
                         .init(name: "Fortnight", rating: "93"),
                         .init(name: "Madian 2024", rating: "90")
                         ]
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section("Platforms") {
                    ForEach(platforms, id: \.name) { platform in
                        NavigationLink(value: platform) {
                            Label(platform.name, systemImage: platform.image)
                                .foregroundStyle(platform.color)
                        }
                    }
                }
                
                Section("Games") {
                    ForEach(games, id: \.name) { game in
                        NavigationLink(value: game) {
                            Text(game.name)
                        }
                    }
                }
            }
            .navigationTitle("Gaming")
            .navigationDestination(for: Platform.self) { platform in
                ZStack {
                    platform.color.ignoresSafeArea()
                    VStack {
                        Label(platform.name, systemImage: platform.image)
                        List {
                            ForEach(games, id: \.name) { game in
                                NavigationLink(value: game) {
                                    Text(game.name)
                                }
                            }
                        }
                    }
                }
                .navigationBarBackButtonHidden()
            }
            .navigationDestination(for: Game.self) { game in
                VStack(spacing: 20) {
                    Text("\(game.name) - \(game.rating)")
                        .font(.headline)
                    
                    Button("Recommend Games") {
                        path.append(games.randomElement()!)
                    }
                    
                    Button("Go to another application") {
                        path.append(platforms.randomElement()!)
                    }
                    
                    Button("Go Home") {
                        path.removeLast(games.count)
                    }
                }
            }
        }
        
    }
}

#Preview {
    GameListView()
}


struct Platform: Hashable {
    let name: String
    let image: String
    let color: Color
}

struct Game: Hashable {
    let name: String
    let rating: String
}
