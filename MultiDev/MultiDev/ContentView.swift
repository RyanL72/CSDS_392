//
//  ContentView.swift
//  MultiDev
//
//  Created by Ryan Lin on 3/15/25.
//

import SwiftUI

struct ContentView: View {
    @State var attendees = AttendeeModel().getAttendees()
    @State var showConfirmation = false
    var body: some View {
        NavigationStack {
            List(attendees) { attendee in
                VStack {
                    HStack {
                        Text(attendee.lastName)
                        Text(attendee.firstName)
                            .foregroundStyle(.secondary)
                        Spacer()
                    }
                    HStack {
                        Text(attendee.email)
                        Spacer()
                    }
                    .foregroundStyle(.secondary)
                    .font(.caption)
                }
            }
            .navigationTitle("Event Attendees")
            .toolbar {
                Button("Clear", systemImage: "checkmark") {
                    showConfirmation = true
                }
                .confirmationDialog("Confirm Delete?", isPresented:$showConfirmation) {
                    Button("Confirm All Attendees Are Here?", role: .destructive) {
                        attendees = []
                        showConfirmation = false
                    }
                    Button("Cancel", role: .cancel) {
                        showConfirmation = false
                    }
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
