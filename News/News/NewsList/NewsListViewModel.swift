//
//  NewsListViewModel.swift
//  News
//
//  Created by karim BEN HAMMOUDA on 27/01/2025.
//

class NewsListViewModel {
    var title: String
    var newsList: NewsList?

    init(title: String) {
        self.title = title
    }
    
    func fetchProductsList(completionHandler: @escaping () -> Void)
    {
        let networkManager = AllNewsNetworkManager()
        networkManager.getNewsList() { (data)  in
            self.newsList = data
            completionHandler()
        }
    }
}
