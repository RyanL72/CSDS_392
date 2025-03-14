//
//  BookView.swift
//  SwiftLN
//
//  Created by Ryan Lin on 3/14/25.
//

import SwiftUI

struct BookView: View {
    @Bindable var book: Book
    var body: some View {
        Form {
            TextField("Book Title", text: $book.title)
            TextField("Book Notes", text: $book.notes, axis: .vertical)
                .lineLimit(3...5)
            DatePicker("Date Read", selection: $book.dateRead, displayedComponents: .date)
        }
    }
}

#Preview {
    @Previewable
    var book = Book(title: "Learning Swift", notes: "A great read!")
    BookView(book: book)
}
