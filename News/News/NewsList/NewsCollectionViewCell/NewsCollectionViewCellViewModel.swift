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
    
    func getDate() -> String? {
        guard let date else { return nil }
        
        let dateFormat = date.dateFormatter(dateString: date, style: .full)
        return String(format: "%@%@", "date".localized(), dateFormat ?? "")
    }
}
