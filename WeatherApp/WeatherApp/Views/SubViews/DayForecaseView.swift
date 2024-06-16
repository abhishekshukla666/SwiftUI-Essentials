//
//  DayForecaseView.swift
//  WeatherApp
//
//  Created by Abhishek Shukla on 08/06/24.
//

import SwiftUI

struct DayForecaseView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("🗓️ 10-DAY FORECAST")
            ForEach(0..<10) {_ in
                DaysForecastCellView()
            }
        }
        .background(.cyan)
    }
}

#Preview {
    DayForecaseView()
}
