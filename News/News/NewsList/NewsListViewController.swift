//
//  NewsListViewController.swift
//  News
//
//  Created by karim BEN HAMMOUDA on 27/01/2025.
//

import UIKit

class NewsListViewController: UIViewController {

    // MARK: - Properties
    var viewModel: NewsListViewModel?

    // MARK: - IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewsCollectionViewCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let viewModel else { return }
        // insert title of Screen
        title = viewModel.title
        // insert bar navigation of Screen
        configureBarItems()
        // get list artciles
        viewModel.fetchNewsList(completionHandler: {
            DispatchQueue.main.async {
                // refresh screen after receiving data
                self.collectionView.reloadData()
            }
        })
    }
}

     // MARK: - private func
extension NewsListViewController {
    private func configureBarItems() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: nil)
    }
}

    // MARK: - UICollectionViewDataSource
extension NewsListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel,
                let newsList =  viewModel.newsList else { return 0 }
        // return number all articles
        return newsList.articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewModel,
                let news =  viewModel.newsList?.articles[indexPath.row] else { fatalError("Unexpected indexPath") }
        // create cell for collection view "NewsCollectionViewCell"
        let cell: NewsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as! NewsCollectionViewCell
        let cellViewModel = NewsCollectionViewCellViewModel(news.title, news.urlToImage, news.author, news.publishedAt)
        cell.setup(viewModel: cellViewModel)
        cell.shadowDecorate()
        return cell
    }
}

    // MARK: - UICollectionViewDelegate
extension NewsListViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension NewsListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        // fixation size cell for collection view "NewsCollectionViewCell"
        return CGSize(width: Constants.screenWidth - 20, height: 300)
    }
    
}
