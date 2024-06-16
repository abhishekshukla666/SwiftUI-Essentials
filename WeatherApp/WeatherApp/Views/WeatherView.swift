//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Abhishek Shukla on 08/06/24.
//

import SwiftUI

struct WeatherView: View {
    
    var body: some View {
        ScrollView {
            VStack {
                WeatherSummaryView()
                HourForecastView()
                DayForecaseView()
            }
            
        }
        .padding()
        .background(.blue)
    }
}

#Preview {
    WeatherView()
}
