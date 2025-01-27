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
}
