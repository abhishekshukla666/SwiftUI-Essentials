//
//  TaskItem.swift
//  TaskManager
//
//  Created by Abhishek Shukla on 16/06/24.
//

import SwiftUI

struct TaskItem: View {
    
    @Binding var task: Task
    
    var body: some View {
        HStack {
            Circle()
                .fill(indicatorColor)
                .frame(width: 10, height: 10)
                .padding(3)
                .background(
                    .white.shadow(
                        .drop(color: .black.opacity(0.1), radius: 3.0)), 
                    in: .circle)
                .overlay {
                    Circle()
                        .frame(width: 50, height: 50)
                        .blendMode(.destinationOver)
                        .onTapGesture {
                            task.isCompleted.toggle()
                        }
                }
                
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(task.title)
                        .font(.system(size: 20, weight: .semibold))
                    
                    Spacer()
                    
                    Label("\(task.date.format("hh:mm a"))", systemImage: "clock.fill")
                        .font(.caption)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Text(task.caption)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(task.tint.opacity(0.7))
            .clipShape(.rect(cornerRadius: 20))
        }
//        .padding(.horizontal)
    }
    
    var indicatorColor: Color {
        if task.isCompleted {
            return .green
        }
        
        return task.date.isSameHour ? .black : (task.date.isPastHour ? .blue: .black)
    }
}

#Preview {
    TaskItem(task: .constant(sampleTask.first!))
}
