//
//  NewsSourceViewController.swift
//  News
//
//  Created by karim BEN HAMMOUDA on 27/01/2025.
//

import WebKit

class NewsSourceViewController: UIViewController, WKNavigationDelegate {

    // MARK: - Properties
    var viewModel: NewsSourceViewModel?
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewModel else { return }

        let url = URL(string: viewModel.url)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
