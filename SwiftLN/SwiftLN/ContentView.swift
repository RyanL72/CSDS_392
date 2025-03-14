//
//  ContentView.swift
//  SwiftLN
//
//  Created by Ryan Lin on 3/14/25.
//
import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var books: [Book]
    @State private var path = [Book]()
    @Environment(\.modelContext) var modelContext
    @AppStorage("firstLaunch") private var firstLaunch = true
    
    func addBook() {
        let book = Book(title: "", notes: "")
        modelContext.insert(book)
        path = [book]
    }
    func deleteBook(_ indexSet:IndexSet) {
        for index in indexSet {
            modelContext.delete(books[index])
        }
    }
    
    var body: some View{
        NavigationStack{
            VStack{
                List{
                    ForEach(books) { book in
                        NavigationLink(value:book){
                            VStack{
                                Text(book.title)
                            }
                        }
                        
                    }
                    .onDelete(perform: deleteBook)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Book Tracker")
            .navigationDestination(for: Book.self, destination: BookView.init)
            .toolbar{
                Button("Add Book", systemImage:"plus", action:addBook)
            }
            .sheet(isPresented: $firstLaunch){
                Text("Welcome to Book Tracker!")
                    .font(.title)
                Button("Get Started"){
                    self.firstLaunch = false
                }
            }
            
        }
    }
    
}

#Preview{
    ContentView()
}

