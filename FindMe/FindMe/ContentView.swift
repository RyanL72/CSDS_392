//
//  ContentView.swift
//  FindMe
//
//  Created by Ryan Lin on 3/18/25.
//

import SwiftUI

struct ContentView: View {
    private let locationManager = LocationManager.shared
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear{
            locationManager.delegate = LocationModel()
            locationManager.requestPermission()
            locationManager.startUpdating()
        }
    }
}

#Preview {
    ContentView()
}
