//
//  WeekDay.swift
//  TaskManager
//
//  Created by Abhishek Shukla on 15/06/24.
//

import SwiftUI


struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0.0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
