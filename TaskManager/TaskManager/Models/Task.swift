//
//  Task.swift
//  TaskManager
//
//  Created by Abhishek Shukla on 15/06/24.
//

import SwiftUI

struct Task: Identifiable {
    let id: UUID = .init()
    let title: String
    let caption: String
    var date: Date = .init()
    var isCompleted = false
    let tint: Color
}

var sampleTask: [Task] = [
    Task(title: "Standup", caption: "Every day meeting", date: Date.now, tint: .yellow),
    Task(title: "Kickoff", caption: "Travel App", date: Date.now, tint: .gray),
    Task(title: "UI Design", caption: "Fintech App", date: Date.now, tint: .green),
    Task(title: "Logo Design", caption: "FinTech App", date: Date.now, tint: .purple)
]

