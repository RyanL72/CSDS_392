//
//  ContentView.swift
//  CSDS_392_1-21
//
//  Created by Ryan Lin on 2/5/25.
//


import SwiftUI

struct ContentView: View {
    @State private var greeting = ""
    var body: some View {
        VStack {
            Spacer()
            Text("Hello, world!")
                .font(.largeTitle)
                .frame(width:200, height:200)
                .background(Color.purple)
                .border(Color.black)
                .cornerRadius(30.0)
            Spacer()
            HStack {
                Text("Greeting")
                Spacer()
                TextField("Enter text", text:$greeting)
            }
            Spacer()
            Button("Send Greeting \(greeting)") {
                print("Button pressed \(greeting)")
            }
            .buttonStyle(.borderedProminent)
        }.padding()
    }
}

#Preview("Primary") {
    ContentView()
}
#Preview {
    ContentView()
}
