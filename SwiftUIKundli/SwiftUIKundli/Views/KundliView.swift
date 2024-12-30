//
//  KundliView.swift
//  SwiftUIKundli
//
//  Created by Abhishek Shukla on 28/05/24.
//

import SwiftUI

struct KundliView: View {
    
    private func housePositions() {
        
        
        
        /*
         
         //            HouseView(house: KundliHouse(id: UUID(), number: 1, planets: []), offsetX: 0, offsetY: -220)
         //            HouseView(house: KundliHouse(id: UUID(), number: 7, planets: []), offsetX: 0, offsetY: -140)
         //
         //            HouseView(house: KundliHouse(id: UUID(), number: 6, planets: []), offsetX: -90, offsetY: -60)
         //            HouseView(house: KundliHouse(id: UUID(), number: 8, planets: []), offsetX: 90, offsetY: -60)
         //
         //            HouseView(house: KundliHouse(id: UUID(), number: 5, planets: []), offsetX: -120, offsetY: -90)
         //            HouseView(house: KundliHouse(id: UUID(), number: 9, planets: []), offsetX: 120, offsetY: -90)
         //
         //            HouseView(house: KundliHouse(id: UUID(), number: 4, planets: []), offsetX: -40, offsetY: -180)
         //            HouseView(house: KundliHouse(id: UUID(), number: 10, planets: []), offsetX: 40, offsetY: -180)
         //
         //            HouseView(house: KundliHouse(id: UUID(), number: 3, planets: []), offsetX: -120, offsetY: -280)
         //            HouseView(house: KundliHouse(id: UUID(), number: 11, planets: []), offsetX: 120, offsetY: -280)
         //
         //            HouseView(house: KundliHouse(id: UUID(), number: 2, planets: []), offsetX: -90, offsetY: -300)
         //            HouseView(house: KundliHouse(id: UUID(), number: 12, planets: []), offsetX: 90, offsetY: -300)
         */
    }
    var houses = KundliHouse.getHouse()
    
    let offsetX: [CGFloat] = [0, 0, -90, 90, -120, 120, -40, 40, -120, 120, -90, 90]
    let offsetY: [CGFloat] = [-220, -140, -60, -60, -90, -90, -180, -180, -280, -280, -300, -300]
    
    var body: some View {
        
        ZStack {
            Kundli()
            .stroke(lineWidth: 2)
            .foregroundStyle(.orange)
            .padding()
            
            ForEach(0..<houses.count) { houseNumber in
                HouseView(house: KundliHouse(id: UUID(),
                                             number: houseNumber + 1,
                                             planets: Planet.getPlanets(for: houseNumber + 1)),
                          offsetX: offsetX[houseNumber],
                          offsetY: offsetY[houseNumber])
                
            }
        }
    }
}

#Preview {
    KundliView()
}

struct HouseView: View {
    
    var house: KundliHouse
    var offsetX: CGFloat
    var offsetY: CGFloat
    
    let columns = [
        GridItem(.flexible(minimum: 100, maximum: 100)),
        GridItem(.flexible(minimum: 100, maximum: 100))
    ]
    
    var body: some View {
        switch(house.number) {
        case 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12:
            Text("\(house.number)")
                .offset(x: offsetX, y: offsetY)
                .font(.headline)
            
            LazyVGrid(columns: columns) {
                ForEach(house.planets, id: \.id) { plant in
                    Text("\(plant.name)")
                        .offset(x: offsetX, y: offsetY)
                        .font(.headline)
                        .foregroundStyle(.blue)
                    
                }
            }
        default: EmptyView()
        }
    }
}
