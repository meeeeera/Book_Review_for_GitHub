//
//  AddBookViewModel.swift
//  Book_Review_IOS_App
//
//  Created by Мира Зейнурова on 26.03.2023.
//

import Foundation

class AddBookViewModel: ObservableObject {
    
    var title: String = ""
    var authorName: String = ""
    @Published var rating: Double = 0
    var releaseDate: Date = Date()
    var bookGenre: String = ""
    
    func save() {
        let manager = CoreDataManager.shared
        let book = Book(context: manager.persistentContainer.viewContext)
        book.title = title
        book.authorName = authorName
        book.bookGenre = bookGenre
        book.rating = rating
        book.releaseDate = releaseDate
        
        manager.saveContext()
    }
    
}
