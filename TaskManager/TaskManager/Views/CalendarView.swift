//
//  CalendarView.swift
//  TaskManager
//
//  Created by Abhishek Shukla on 15/06/24.
//

import SwiftUI

struct CalendarView: View {
    
    @State var currentDate: Date = .init()
    
    @State private var weekSlider: [[Date.WeekDay]] = []
    @State var currentWeekIndex: Int = 1
    
    @State private var createWeek: Bool = false
    
    @State private var task: [Task] = sampleTask.sorted { $0.date > $1.date }
    
    @State private var createNewTask: Bool = false
    
    var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading) {
                    Text("Calendar")
                        .font(.system(size: 36, weight: .semibold))
                    
                    /* Week Slider */
                    TabView(selection: $currentWeekIndex) {
                        ForEach(weekSlider.indices, id: \.self) { index in
                            let week = weekSlider[index]
                            WeekView(week: week) { value in
                                if createWeek {
                                    paginateWeek()
                                    createWeek = false
                                }
                            }
                            .tag(index)
                                
                        }
                        
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .frame(height: 90)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .onChange(of: currentWeekIndex, initial: false) { oldValue, newValue in
                    if newValue == 0 || newValue == weekSlider.count - 1 {
                        createWeek = true
                    }
                }
                .background {
                    Rectangle().fill(.gray.opacity(0.1))
                        .ignoresSafeArea()
                }
                
                ScrollView(.vertical) {
                    VStack {
                        TaskView()
                            .padding()
                    }
                    .hSpacing(.leading)
                    .vSpacing(.top)
                }
                .scrollIndicators(.never)
                
            }
            .vSpacing(.top)
            .frame(maxWidth: .infinity)
            .onAppear() {
                if weekSlider.isEmpty {
                    let currentWeek = Date().fetchWeek()
                    if let firstDate = currentWeek.first?.date {
                        weekSlider.append(firstDate.createPrevioustWeek())
                    }
                    
                    weekSlider.append(currentWeek)
                    
                    if let lastDate = currentWeek.last?.date {
                        weekSlider.append(lastDate.createNextWeek())
                    }
                }
            }
            .overlay(alignment: .bottomTrailing) {
                /* Add new task */
                Button {
                    createNewTask.toggle()
                } label: {
                    Image(systemName: "plus")
                        .imageScale(.large)
                        .padding(26)
                        .foregroundStyle(.white)
                        .background(Circle().fill(.black))
                        
                }
                .fullScreenCover(isPresented: $createNewTask) {
                    NewTaskView()
                }
                .padding(.horizontal, 30)
            }
    }
    
    func paginateWeek() {
        if weekSlider.indices.contains(currentWeekIndex) {
            if let firstDate = weekSlider[currentWeekIndex].first?.date, currentWeekIndex == 0 {
                weekSlider.insert(firstDate.createPrevioustWeek(), at: 0)
                weekSlider.removeLast()
                currentWeekIndex = 1
            }
            
            if let lastDate = weekSlider[currentWeekIndex].last?.date, currentWeekIndex == weekSlider.count - 1 {
                weekSlider.append(lastDate.createNextWeek())
                weekSlider.removeFirst()
                currentWeekIndex = weekSlider.count - 2
            }
        }
    }
    
}

#Preview {
    CalendarView()
}
