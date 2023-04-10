//
//  Date+Extension.swift
//  Book_Review_IOS_App
//
//  Created by Мира Зейнурова on 26.03.2023.
//

import Foundation

extension Date {
    
    func asFormattedString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: self)
    }
}
