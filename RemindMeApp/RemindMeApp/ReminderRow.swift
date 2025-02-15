//
//  ReminderRow.swift
//  RemindMeApp
//
//  Created by Ryan Lin on 2/14/25.
//

import SwiftUI

struct ReminderRow: View {
    let reminder: Reminder
    var body: some View{
        VStack{
            HStack{
                Text(reminder.title)
                    .font(.headline)
                Spacer()
            }
            HStack{
                Text(reminder.notes)
                    .foregroundStyle(.secondary)
                Spacer()
                Text(reminder.priority.rawValue)
                    .font(.caption)
                    .foregroundStyle(Color.accentColor)
            }
        }
    }
}

#Preview{
    ReminderRow(reminder: Reminder(title:"Test",priority: .high, notes:"Go for a run"))
}
