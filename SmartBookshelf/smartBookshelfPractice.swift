//
//  smartBookshelfPractice.swift
//  OrderingSystemInCafe
//
//  Created by Валерия Пономарева on 24.10.2025.
//

import Foundation

struct Book {
    let title: String
    let author: String
    let year: Int
    
    init?(title: String, author: String, year: Int) {
        guard !title.isEmpty, !author.isEmpty, year <= 2025 else {
            return nil }
        self.title = title
        self.author = author
        self.year = year
    }
}

struct Bookshelf {
    var books: [Book] = []
    
    var booksCount: Int { books.count }
    
    var averageYear: Double {
        guard !books.isEmpty else { return 0 }
        let totalYears = books.reduce(0) { $0 + $1.year }
        return Double(totalYears) / Double(books.count)
    }
    
    mutating func addBook(_ book: Book) { books.append(book) }
        
    mutating func removeBook(at index: Int) {
        guard index >= 0 && index < books.count else { return }
        books.remove(at: index)
    }
    func findBooks(by author: String) -> [Book] {
        return books.filter { $0.author == author }
    }
}

// tests

var shelf = Bookshelf()

if let shining = Book(title: "Shining", author: "Stephen King", year: 1977),
   let theDarkTower = Book(title: "The Dark Tower", author: "Stephen King", year: 2004),
   let gunslinger = Book(title: "The Gunslinger", author: "Stephen King", year: 1982) {
    
    shelf.addBook(shining)
    shelf.addBook(theDarkTower)
    shelf.addBook(gunslinger)
    
    let kingBooks = shelf.findBooks(by: "Stephen King")
   
    print("📖 Books on shelf: \(shelf.booksCount)")
    print("📅 Average year: \(String(format: "%.2f", shelf.averageYear))")
    print("🔎 Find books of Stephen King: \(kingBooks.count)")

}
/* Ordering System in Cafe
 Shopping List Practice
 📖 Books on shelf: 3
 📅 Average year: 1987.67
 🔎 Find books of Stephen King: 3 */
