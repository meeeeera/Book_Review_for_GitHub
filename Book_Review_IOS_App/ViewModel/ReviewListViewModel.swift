//
//  ReviewListViewModel.swift
//  Book_Review_IOS_App
//
//  Created by Мира Зейнурова on 03.04.2023.
//

import Foundation
import CoreData

class ReviewListViewModel: ObservableObject {
    
    @Published var reviews = [ReviewViewModel]()
    
    
    struct ReviewViewModel {
        
        let review: Review
        
//        var reviewId: NSManagedObjectID {
//            return review.objectID
//        }
        
        var title: String {
            return review.title ?? ""
        }
        
        var text: String {
            return review.text ?? ""
        }
        
    }
}
