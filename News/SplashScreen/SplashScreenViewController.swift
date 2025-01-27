//
//  SplashScreenViewController.swift
//  News
//
//  Created by karim BEN HAMMOUDA on 27/01/2025.
//

import UIKit

class SplashScreenViewController: UIViewController {

    // MARK: - Private Properties
    private var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        imageView.image = UIImage(named: "logo")
        return imageView
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        DispatchQueue.main.asyncAfter(deadline: .now()+6) {
            self.goToNewsList()
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now()+5) {
            self.animateZoomIn(imageView: self.imageView)
        }
    }

    // A light status bar, intended for use on dark backgrounds.
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}

// Navigation
extension SplashScreenViewController {
    // GO To NewsListViewController
    func goToNewsList() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "NewsList", bundle:nil)
        let newsListViewController = storyBoard.instantiateViewController(withIdentifier: "NewsListViewController") as! NewsListViewController
        newsListViewController.viewModel = NewsListViewModel(title: "NewsListTitle".localized())
        let navController = UINavigationController(rootViewController: newsListViewController)
        navController.modalPresentationStyle = .fullScreen
        self.view.window?.rootViewController = navController
    }
}
