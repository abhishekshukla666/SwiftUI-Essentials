//
//  DaysForecastCellView.swift
//  WeatherApp
//
//  Created by Abhishek Shukla on 08/06/24.
//

import SwiftUI

struct DaysForecastCellView: View {
    var body: some View {
        HStack {
            Text("Today")
            Text("☀️")
            Text("52")
            ProgressView(value: 40)
            Text("72")
        }
    }
}

#Preview {
    DaysForecastCellView()
}
