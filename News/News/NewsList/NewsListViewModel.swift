//
//  NewsListViewModel.swift
//  News
//
//  Created by karim BEN HAMMOUDA on 27/01/2025.
//

class NewsListViewModel {
    // MARK: - Properties
    var title: String
    var newsList: NewsList?

    // MARK: - Init View Model
    init(title: String) {
        self.title = title
    }
}

    // MARK: - Fetch data
extension NewsListViewModel {
    // get list of News
    func fetchNewsList(completionHandler: @escaping () -> Void)
    {
        let networkManager = AllNewsNetworkManager()
        // get list news with web service
        networkManager.getNewsList() { (data)  in
            self.newsList = data
            completionHandler()
        }
    }
}
