//
//  BookListViewModel.swift
//  Book_Review_IOS_App
//
//  Created by Мира Зейнурова on 26.03.2023.
//

import Foundation
import CoreData

class BookListViewModel: ObservableObject {
    
    @Published var books = [BookViewModel]()
    
//    func deleteBook(book: BookViewModel?) {
//        let movie = CoreDataManager.shared.getBookById(id: book!.id)
//        if let book = book {
//            CoreDataManager.shared.getAllBooks()
//        }
//    }
    
//    func getAllBooks() {
//        let books = CoreDataManager.shared.getResultContainer(entityName: "Book", sortingKey: "title")
//        DispatchQueue.main.async {
//            self.books = books.map(BookViewModel.init)
//        }
//    }
}

struct BookViewModel {
    
    let book: Book
    
    var id: NSManagedObjectID {
        return book.objectID
    }
    
    var title: String {
        return book.title ?? ""
    }
    
    var authorName: String {
        return book.authorName ?? "Not available"
    }
    
    var releaseDate: String? {
            return book.releaseDate?.asFormattedString()
        }
    

    var rating: Double {
        return book.rating ?? 0.2
    }
    
    
}
