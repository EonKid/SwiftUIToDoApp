//
//  EditTaskView.swift
//  ToDoApp
//
//  Created by Dhruv Narayan Singh on 04/08/25.
//
import SwiftUI

struct EditTaskView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: TaskViewModel
    var task: TaskItem

    @State private var editedTitle: String

    init(viewModel: TaskViewModel, task: TaskItem) {
        self.viewModel = viewModel
        self.task = task
        print("task: \(task.title)")
        _editedTitle = State(initialValue: task.title)
    }

    var body: some View {
        
            Form {
                TextField("Edit Task", text: $editedTitle)
            }
            .navigationTitle("Edit Task")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        viewModel.updateTaskTitle(id: task.id, newTitle: editedTitle)
                        dismiss()
                    }
                }

                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        
    }
}

