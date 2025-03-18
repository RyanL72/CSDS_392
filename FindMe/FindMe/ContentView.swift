//
//  ContentView.swift
//  FindMe
//
//  Created by Ryan Lin on 3/18/25.
//

import SwiftUI


struct ContentView: View {
    private let locationManager = LocationManager.shared
    private let locationModel = LocationModel()
    var body: some View {
        NavigationStack {
            
            List(locationModel.locations, id:\.self){ location in
                Text("\(location.coordinate.latitude) , \(location.coordinate.longitude)")
            }
            .navigationTitle("Where am I?")
        }
        .padding()
        .onAppear{
            locationManager.delegate = locationModel
            locationManager.requestPermission()
            locationManager.startUpdating()
        }
    }
}

#Preview {
    ContentView()
}
