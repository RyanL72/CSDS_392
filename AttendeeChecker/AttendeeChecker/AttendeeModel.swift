//
//  AttendeeModel.swift
//  MultiDev
//
//  Created by Ryan Lin on 3/15/25.
//

import Foundation

struct AttendeeModel {
    private let testAttendees: [Attendee] = (1...50).map{ _ in
        let firstNames = ["John", "Jane", "Alex", "Emily", "Chris", "Katie", "Max", "Sarah", "Ryan", "Olivia"]
        let lastNames = ["Smith", "Johnson", "Williams", "Brown", "Jones", "Davis", "Miller", "Wilson", "Moore", "Taylor"]
        
        var randomFirstName = firstNames.randomElement() ?? "John"
        var randomLastName = lastNames.randomElement() ?? "Doe"
        var randomEmail = "\(randomFirstName.lowercased()).\(randomLastName.lowercased())@example.com"
        
        return Attendee(
            id: UUID(),
            firstName: randomFirstName,
            lastName: randomLastName,
            email: randomEmail
        )
    }
    
    func getAttendees() ->[Attendee]{
        return testAttendees
    }
}
