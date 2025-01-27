//
//  String+Utiles.swift
//  News
//
//  Created by karim BEN HAMMOUDA on 27/01/2025.
//

import Foundation

extension String {
    func dateFormatter(style: DateFormatter.Style) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = .current
        formatter.dateStyle = style
        formatter.locale = Locale(identifier: "fr_FR")
        return formatter.string(from: Date())
    }
}
