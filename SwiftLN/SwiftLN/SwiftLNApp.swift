//
//  SwiftLNApp.swift
//  SwiftLN
//
//  Created by Ryan Lin on 3/14/25.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataLNApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
    
}
