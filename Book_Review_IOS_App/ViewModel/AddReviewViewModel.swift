//
//  AddReviewViewModel.swift
//  Book_Review_IOS_App
//
//  Created by Мира Зейнурова on 26.03.2023.
//

import Foundation

class AddReviewViewModel: ObservableObject {

    var title: String = ""
    var text: String = ""

    func addReviewForBook(vm: BookViewModel) {

//        let book = CoreDataManager.shared.getBookById(id: vm.id)

        let review = Review(context: CoreDataManager.shared.persistentContainer.viewContext)
        review.title = title
        review.text = text
//        review.book = book

        CoreDataManager.shared.saveContext()

    }

}
