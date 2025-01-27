//
//  NewsDetailsViewController.swift
//  News
//
//  Created by karim BEN HAMMOUDA on 27/01/2025.
//

import UIKit

class NewsDetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsAuthorView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var sourceLinkLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var descriptionTitleLabel: UILabel!
    @IBOutlet weak var contentTitleLabel: UILabel!

    // MARK: - Properties
    var viewModel: NewsDetailsViewModel?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let viewModel else { return }

        setImage()
        titleLabel.text = viewModel.news.title
        setViewsAuthor()
        descriptionTitleLabel.text = "descriptionTitle".localized()
        descriptionLabel.text = viewModel.news.description
        setupSourceLink()
        contentTitleLabel.text = "contentTitle".localized()
        contentLabel.text = viewModel.news.content
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

    // MARK: - Private Function
extension NewsDetailsViewController {
    private func setImage() {
        guard let viewModel else { return }

        // add round of corners articles
        imageView.roundCorners([.allCorners], radius: 10)
        // set image with url
        if let imageUrl = viewModel.news.urlToImage {
            imageView.downloaded(from: imageUrl,
                                 contentMode: .scaleAspectFill)
        }
    }
    
    private func setViewsAuthor() {
        guard let viewModel else { return }

        let customNewsAthorView = NewsAuthorView(frame: CGRect(x: 0, y: 0, width: Constants.screenWidth, height: 75))
        customNewsAthorView.viewModel = NewsAuthorViewModel(author: viewModel.news.author, date: viewModel.news.publishedAt)
        customNewsAthorView.setupData()
        newsAuthorView.addSubview(customNewsAthorView)
    }
    
    private func setupSourceLink() {
        guard let sourceName = viewModel?.news.source?.name else { return }

        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.linkLabelTapped(_:)))
        sourceLinkLabel.isUserInteractionEnabled = true
        sourceLinkLabel.addGestureRecognizer(labelTap)

        let string = String(format: "%@%@", "sourceLink".localized(), sourceName)
        let attrStri = NSMutableAttributedString.init(string: string)
        let nsRange = NSString(string: string)
                .range(of: sourceName, options: String.CompareOptions.caseInsensitive)
        attrStri.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.blue, NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue], range: nsRange)
        sourceLinkLabel.attributedText = attrStri
    }
    
    @objc func linkLabelTapped(_ sender: UITapGestureRecognizer) {
        goToNewsSource()
    }
}

// MARK: - Navigation
extension NewsDetailsViewController {
    // GO To NewsSourceViewController
    func goToNewsSource() {
        guard let url = viewModel?.news.url else { return }

        let storyBoard: UIStoryboard = UIStoryboard(name: "NewsSource", bundle:nil)
        let newsSourceViewController = storyBoard.instantiateViewController(withIdentifier: "NewsSourceViewController") as! NewsSourceViewController
        newsSourceViewController.viewModel = NewsSourceViewModel(url: url)
        self.navigationController?.present(newsSourceViewController, animated: true)
    }
}
