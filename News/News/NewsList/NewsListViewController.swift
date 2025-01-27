//
//  NewsListViewController.swift
//  News
//
//  Created by karim BEN HAMMOUDA on 27/01/2025.
//

import UIKit

class NewsListViewController: UIViewController {

    var viewModel: NewsListViewModel?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewModel else { return }

        title = viewModel.title
        viewModel.fetchProductsList(completionHandler: {
            print(viewModel.newsList)
        })
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

}
