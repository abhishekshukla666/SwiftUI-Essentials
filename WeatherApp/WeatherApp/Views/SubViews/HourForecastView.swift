//
//  HourForecastView.swift
//  WeatherApp
//
//  Created by Abhishek Shukla on 08/06/24.
//

import SwiftUI

struct HourForecastView: View {
    var body: some View {
        VStack {
            Text("Sunny caonditions will continue for the rest of the day. Wind gusts are up to 18 mph.")
            ScrollView(.horizontal) {
                HStack {
                    ForEach(1..<24) { _ in
                        VStack {
                            Text("Now")
                            Text("☀️")
                            Text("68")
                        }
                    }
                }
            }
        }
        .padding(10)
        .background(.purple)
    }
}

#Preview {
    HourForecastView()
}
