//
//  StringExtensions.swift
//  newsApp
//
//  Created by User on 22.10.21.
//

import UIKit

extension String {
    func getDate() -> Date {
        let calendar = Calendar(identifier: .gregorian)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        dateFormatter.timeZone = calendar.timeZone
        let date = dateFormatter.date(from: self)
        return date ?? Date()
    }
}
