//
//  ContentView.swift
//  CSDS_392_1-23
//
//  Created by Ryan Lin on 2/5/25.
//

import SwiftUI

struct MagicText {
    let text:String
    init(_ text:String) {
        self.text = text
        print("Creating \(text)")
    }
}

struct ToDo: Identifiable {
    let id = UUID()
    let todo:String
}

struct ContentView: View {
    @State var everyDay = ["Study for Quiz", "Learn Swift UI", "Run"]
    @State var todos = [String]()
    @State var todo=""
    var body: some View {
        VStack {
            List{
                Section {
                    ForEach(everyDay, id:\.self){
                        todo in Text(todo)
                    }
                }
                header:{
                    Text("Every Day")
                }
                Section {
                    ForEach(todos, id:\.self){
                        todo in Text(todo)
                    }
                }
                header:{
                    Text("To Do List")
                }
            }
            .listStyle(.grouped)
            .refreshable{
                todos.removeAll()
            }
            HStack{
                TextField("Add Todo", text:$todo)
                Button("Add"){
                    todos.append(todo)
                    todo=""
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
