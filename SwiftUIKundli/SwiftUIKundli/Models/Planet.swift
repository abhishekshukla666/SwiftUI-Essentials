//
//  Planet.swift
//  SwiftUIKundli
//
//  Created by Abhishek Shukla on 28/05/24.
//

import Foundation

struct Planet {
    let id: UUID
    let name: String
    let degree: Double
}

extension Planet {
    static func getPlanets(for houseNumber: Int) -> [Planet] {
        
        switch houseNumber {
        case 1:
            return [
                Planet.init(id: UUID(), name: "Ven", degree: 1.04),
                Planet.init(id: UUID(), name: "Moo", degree: 10.09),
                Planet.init(id: UUID(), name: "Lagn", degree: 17.36),
                Planet.init(id: UUID(), name: "Murc", degree: 22.09),
                Planet.init(id: UUID(), name: "Rah", degree: 22.45)
            ]
        case 2:
            return [
                Planet.init(id: UUID(), name: "Sun", degree: 10.22)
            ]
        
        case 6:
            return [
                Planet.init(id: UUID(), name: "Jup", degree: 07.05)
            ]
        case 7:
            return [
                Planet.init(id: UUID(), name: "Ket", degree: 22.45)
            ]
        case 12:
            return [
                Planet.init(id: UUID(), name: "Sat", degree: 27.49),
                Planet.init(id: UUID(), name: "Mar", degree: 24.00)
            ]
        default:
            return []
        }
        
    }
}
