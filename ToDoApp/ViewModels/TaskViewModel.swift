//
//  TaskViewModel.swift
//  ToDoApp
//
//  Created by Dhruv Narayan Singh on 03/08/25.
//
import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks: [TaskItem] = []

    func addTask(title: String) {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        tasks.append(TaskItem(title: title))
    }

    func toggleCompletion(for task: TaskItem) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }

    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
    
    func updateTaskTitle(id: UUID, newTitle: String) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks[index].title = newTitle
        }
    }

}

