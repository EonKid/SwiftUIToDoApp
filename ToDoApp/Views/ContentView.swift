//
//  ContentView.swift
//  ToDoApp
//
//  Created by Dhruv Narayan Singh on 03/08/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TaskViewModel()
    @State private var newTaskTitle = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("New Task", text: $newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    Button(action: {
                        viewModel.addTask(title: newTaskTitle)
                        newTaskTitle = ""
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                    .padding(.trailing)
                }

                List {
                    ForEach(viewModel.tasks) { task in
                        NavigationLink(destination: EditTaskView(viewModel: viewModel, task: task)) {
                            HStack {
                                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .onTapGesture {
                                        viewModel.toggleCompletion(for: task)
                                    }
                                Text(task.title)
                                    .strikethrough(task.isCompleted, color: .gray)
                            }
                        }
                    }
                    .onDelete(perform: viewModel.deleteTask)
                }
            }
            .navigationTitle("To-Do")
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
