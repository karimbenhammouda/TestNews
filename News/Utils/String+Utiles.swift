//
//  String+Utiles.swift
//  News
//
//  Created by karim BEN HAMMOUDA on 27/01/2025.
//

import Foundation

extension String {
    func dateFormatter(dateString: String, style: DateFormatter.Style) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = .current
        formatter.dateStyle = style
        formatter.locale = Locale(identifier: "fr_FR")
        let date = convertDateString(dateString: dateString)
        return formatter.string(from: date)
    }
    
    func convertDateString(dateString: String) -> Date {
        let dateFormatter = ISO8601DateFormatter()
        let date = dateFormatter.date(from:dateString)!
        return date
    }
}
