//
//  ReminderModel.swift
//  RemindMeApp
//
//  Created by Ryan Lin on 2/14/25.
//

// Operations for Reminders

import Foundation

// File Management System
struct ReminderModel{
    
    // Returns the reminder url.
    static private func fileURL() -> URL? {
        let manager = FileManager.default
        let documentsDirectory = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        return documentsDirectory?.appendingPathComponent("reminders.json")
    }
    
    // Save the reminders
    static public func save(_ reminders:[Reminder]){
        let encoder = JSONEncoder()
        do{
            let data = try encoder.encode(reminders)
            if let fileURL = fileURL(){
                try data.write(to: fileURL, options: [.completeFileProtection, .atomic])
            }
        }
        catch{
            print("Unable to to save data \(error)")
        }
    }
    
    // Load
    public static func load() -> [Reminder] {
        let decoder = JSONDecoder()
        if let fileURL = fileURL(),
           let data = try? Data(contentsOf: fileURL),
           let loadedReminders = try? decoder.decode([Reminder].self, from: data){
            return loadedReminders
        }
        return [Reminder]()
        
    }
}
