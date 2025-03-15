//
//  LargeAttendeeView.swift
//  MultiDev
//
//  Created by Ryan Lin on 3/15/25.
//

import SwiftUI

struct largeAttendeeView : View{
    @State var attendees = AttendeeModel().getAttendees()
    @State var columns = [GridItem(.flexible()), GridItem(.flexible())]
    @State var showConfirmation = false
    
    let portraitColumns = [GridItem(.flexible()), GridItem(.flexible())]
    let landscapeColumns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    func updateLayout(){
        if UIDevice.current.orientation.isLandscape{
            columns = landscapeColumns
        }
        else{
           columns = portraitColumns
        }
    }
    
    var body: some View{
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns, spacing:15){
                    ForEach(attendees) { attendee in
                        VStack{
                            HStack{
                                Text(attendee.lastName)
                                Text(attendee.firstName)
                                    .foregroundStyle(.secondary)
                                Spacer()
                            }
                            HStack{
                                Text(attendee.email)
                                Spacer()
                            }
                            .foregroundStyle(.secondary)
                            .font(.caption)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Event Attendees")
            .toolbar{
                Button("Clear", systemImage:"checkmark"){
                    showConfirmation = true
                }
                .confirmationDialog("Confirm Delete?" , isPresented:$showConfirmation){
                    Button("Confirm All Attendees Are Here?", role: .destructive){
                        attendees = []
                        showConfirmation = false
                    }
                    Button("Cancel", role: .cancel){
                        showConfirmation = false
                    }
                }
            }
        }
        .onAppear{
            updateLayout()
        }
        .onReceive(NotificationCenter.default.publisher(for:UIDevice.orientationDidChangeNotification)) { _ in
            updateLayout()
        }
    }
}

#Preview{
    largeAttendeeView()
}
