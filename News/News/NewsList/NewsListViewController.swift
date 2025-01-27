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
        guard let viewModel else { return }
        
        // insert title of Screen
        title = viewModel.title

        // registre all cell of CollectionView
        registerCollectionView()

        // insert bar navigation of Screen
        configureBarItems()
        // get list artciles
        fetchNewsList()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

     // MARK: - private func
extension NewsListViewController {
    private func configureBarItems() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: nil)
    }

    private func registerCollectionView() {
        collectionView.register(UINib(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewsCollectionViewCell")
    }

    private func fetchNewsList() {
        guard let viewModel else { return }

        viewModel.fetchNewsList(completionHandler: {
            DispatchQueue.main.async {
                // refresh screen after receiving data
                self.collectionView.reloadData()
            }
        })
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let viewModel,
        let news = viewModel.newsList?.articles[indexPath.row] else { return }

        goToNewsDetails(news)
    }
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

    // MARK: - Navigation
extension NewsListViewController {
    // GO To NewsDetailsViewController
    func goToNewsDetails(_ news: News) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "NewsDetails", bundle:nil)
        let newsDetailsViewController = storyBoard.instantiateViewController(withIdentifier: "NewsDetailsViewController") as! NewsDetailsViewController
        newsDetailsViewController.viewModel = NewsDetailsViewModel(news: news)
        self.navigationController?.pushViewController(newsDetailsViewController, animated: true)
    }
}
