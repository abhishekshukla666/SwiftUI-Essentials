//
//  KundliView.swift
//  SwiftUIKundli
//
//  Created by Abhishek Shukla on 28/05/24.
//

import SwiftUI

struct KundliView: View {
    
    
    var houses = KundliHouse.getHouse()
    
    var body: some View {
        
        ZStack {
            Kundli()
            .stroke(lineWidth: 2)
            .foregroundStyle(.orange)
            .padding()
            
            
            ForEach(houses, id:\.id) { house in
                HouseView(house: house, offsetX: 1, offsetY: 1)
                
            }
            
//            HouseNumber(number: 1, offsetX: 0, offsetY: -220)
//            HouseNumber(number: 2, offsetX: -90, offsetY: -300)
//            HouseNumber(number: 3, offsetX: -120, offsetY: -270)
//            HouseNumber(number: 4, offsetX: -40, offsetY: -180)
//            HouseNumber(number: 5, offsetX: -120, offsetY: -90)
//            HouseNumber(number: 6, offsetX: -90, offsetY: -60)
//            HouseNumber(number: 7, offsetX: 0, offsetY: -140)
//            HouseNumber(number: 8, offsetX: 90, offsetY: -60)
//            HouseNumber(number: 9, offsetX: 120, offsetY: -90)
//            HouseNumber(number: 10, offsetX: 40, offsetY: -180)
//            HouseNumber(number: 11, offsetX: 120, offsetY: -270)
//            HouseNumber(number: 12, offsetX: 90, offsetY: -300)

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
    
    var body: some View {
        VStack {
            Text("\(house.number)")
                .offset(x: offsetX, y: offsetY)
                .font(.headline)
            
            ForEach(house.planets, id: \.id) { plant in
                Text("\(plant.name)")
                    .offset(x: offsetX * 30, y: offsetY * 30)
                    .font(.headline)
                
            }
        }
        
    }
}
