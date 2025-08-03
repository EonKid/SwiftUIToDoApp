//
//  TaskItem.swift
//  ToDoApp
//
//  Created by Dhruv Narayan Singh on 03/08/25.
//
import Foundation

struct TaskItem: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
}

