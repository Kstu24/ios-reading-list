//
//  BookController.swift
//  Reading List
//
//  Created by Kevin Stewart on 12/6/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class BookController: Codable {
    
    init() {
        loadFromPersistentStore()
    }
    var books: [Book] = []
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documents.appendingPathComponent("books.list")
    }
    
    @discardableResult func createBook(titled title: String, withReason reasonToRead: String) -> Book {
        let book = Book(title: title, reasonToRead: reasonToRead)
        books.append(book)
        saveToPersistentStore()
        return book
    }
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(books)
            try data.write(to: url)
            
        } catch {
            print("Error saving books data: \(error)")
        }
    }
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL,
            fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            books = try decoder.decode([Book].self, from: data)
        } catch {
            print("Error saving books data: \(error)")
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
        books.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
     func updateHasBeenRead(for book: Book) {
        var updateHasBeenRead = book.hasBeenRead
        updateHasBeenRead.toggle()
        if updateHasBeenRead == true {
            updateHasBeenRead.description
        }
//        updateView()
        }
    
    
     func updateReasonToRead(for book: Book) {
        var updateReasonToRead = book.reasonToRead
    }
    
    var readBooks: [Book] {
        let filteredBooks = self.books.filter {$0.hasBeenRead == true}
        return filteredBooks
    }
    
    var unreadBooks: [Book] {
        let unfilteredBooks = self.books.filter {$0.hasBeenRead == false}
        return unfilteredBooks
    }
}
