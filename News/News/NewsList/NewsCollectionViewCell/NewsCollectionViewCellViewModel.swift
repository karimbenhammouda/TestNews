//
//  NewsCollectionViewCellViewModel.swift
//  News
//
//  Created by karim BEN HAMMOUDA on 27/01/2025.
//

class NewsCollectionViewCellViewModel {
    // MARK: - Properties
    var title: String?
    var urlToImage: String?
    var author: String?
    var date: String?

    // MARK: - ViewModel Init
    init(_ title: String?, _ urlToImage: String?, _ author: String?, _ date: String?) {
        self.title = title
        self.urlToImage = urlToImage
        self.author = author
        self.date = date
    }
}
