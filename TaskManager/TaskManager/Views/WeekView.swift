//
//  WeekView.swift
//  TaskManager
//
//  Created by Abhishek Shukla on 15/06/24.
//

import SwiftUI

struct WeekView: View {
    
    var week: [Date.WeekDay]
    @State private var currentDate: Date = .init()
    
    @Namespace private var animationWeek
    
    var onTap: (CGFloat) -> Void?
    
    var body: some View {
        HStack {
            ForEach(week, id:\.id) { day in
                VStack {
                    Text(day.date.format("E"))
                        .font(.callout)
                        .fontWeight(.medium)
                        .textScale(.secondary)
                        .foregroundStyle(.gray)
                    
                    Text(day.date.format("dd"))
                        .font(.system(size: 20))
                        .frame(width: 40, height: 50)
                        .foregroundStyle(isSameDate(day.date, currentDate) ? .white : .black)
                        .background(content: {
                            if isSameDate(day.date, currentDate) {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.black)
                                    .matchedGeometryEffect(id: "TABINDICATOR", in: animationWeek)
                            }
                            
                            if day.date.isToday {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 5, height: 5)
                                    .offset(y: 18)
                            }
                        })
                }
                .hSpacing(.center)
                .onTapGesture {
                    withAnimation(.snappy) {
                        currentDate = day.date
                    }
                }
            }
        }
        .background {
            GeometryReader {
                let minX = $0.frame(in: .global).minX
                
                Color.clear
                    .preference(key: OffsetKey.self, value: minX)
                    .onPreferenceChange(OffsetKey.self, perform: { value in
                        if value.rounded() == 15 {
                            self.onTap(value)
                        }
                    })
            }
        }
    }
}

#Preview {
    WeekView(week: Date().fetchWeek()) { _ in
        
    }
}
