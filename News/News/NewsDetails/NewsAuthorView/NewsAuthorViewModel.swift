//
//  NewsAuthorViewModel.swift
//  News
//
//  Created by karim BEN HAMMOUDA on 27/01/2025.
//

import Foundation

class NewsAuthorViewModel {
    // MARK: - Properties
    var author: String?
    var date: String?

    // MARK: - Init View Model
    init(author: String?, date: String?) {
        self.author = author
        self.date = date
    }
    
    func getDate() -> String? {
        guard let date else { return nil }
        
        let dateFormat = date.dateFormatter(dateString: date, style: .full)
        return String(format: "%@%@", "date".localized(), dateFormat ?? "")
    }
}
