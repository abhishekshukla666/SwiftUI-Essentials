//
//  KundliHouse.swift
//  SwiftUIKundli
//
//  Created by Abhishek Shukla on 28/05/24.
//

import Foundation

struct KundliHouse {
    let id: UUID
    let number: Int
    let planets: [Planet]
}

extension KundliHouse {
    static func getHouse() -> [KundliHouse] {
        return [
            KundliHouse.init(id: UUID(), number: 1, planets: Planet.getPlanets(for: 1)),
            KundliHouse.init(id: UUID(), number: 2, planets: Planet.getPlanets(for: 2)),
            KundliHouse.init(id: UUID(), number: 3, planets: Planet.getPlanets(for: 3)),
            KundliHouse.init(id: UUID(), number: 4, planets: Planet.getPlanets(for: 4)),
            KundliHouse.init(id: UUID(), number: 5, planets: Planet.getPlanets(for: 5)),
            KundliHouse.init(id: UUID(), number: 6, planets: Planet.getPlanets(for: 6)),
            KundliHouse.init(id: UUID(), number: 7, planets: Planet.getPlanets(for: 7)),
            KundliHouse.init(id: UUID(), number: 8, planets: Planet.getPlanets(for: 8)),
            KundliHouse.init(id: UUID(), number: 9, planets: Planet.getPlanets(for: 9)),
            KundliHouse.init(id: UUID(), number: 10, planets: Planet.getPlanets(for: 10)),
            KundliHouse.init(id: UUID(), number: 11, planets: Planet.getPlanets(for: 11)),
            KundliHouse.init(id: UUID(), number: 12, planets: Planet.getPlanets(for: 12))
        ]
    }
}
