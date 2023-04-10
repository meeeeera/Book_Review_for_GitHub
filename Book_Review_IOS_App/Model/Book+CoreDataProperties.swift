//
//  Book+CoreDataProperties.swift
//  
//
//  Created by Мира Зейнурова on 03.04.2023.
//
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var authorName: String?
    @NSManaged public var bookGenre: String?
    @NSManaged public var rating: Double
    @NSManaged public var releaseDate: Date?
    @NSManaged public var title: String?

}
