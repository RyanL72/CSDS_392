//
//  Book.swift
//  SwiftLN
//
//  Created by Ryan Lin on 3/14/25.
//

import Foundation
import SwiftData

@Model
class Book{
    var title:String
    var notes:String
    var dateRead:Date
    
    init(title: String, notes: String, dateCreated:Date = .now) {
        self.title = title
        self.dateRead = dateCreated
        self.notes = notes
    }
}
