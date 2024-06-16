//
//  TaskView.swift
//  TaskManager
//
//  Created by Abhishek Shukla on 15/06/24.
//

import SwiftUI

struct TaskView: View {

    @State private var taskList = sampleTask
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach($taskList, id:\.id) { task in
                TaskItem(task: task)
                    .background(alignment: .leading) {
                        if taskList.last?.id != task.id {
                            Rectangle()
                                .frame(width: 1)
                                .offset(x: 7.5, y: 50)
                        }
                    }
            }
        }
    }
}

#Preview {
    TaskView()
}
