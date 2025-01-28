//
//  NewsCollectionViewCell.swift
//  News
//
//  Created by karim BEN HAMMOUDA on 27/01/2025.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    var viewModel: NewsCollectionViewCellViewModel?
    
    // MARK: - IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: - Setup
    func setup(viewModel: NewsCollectionViewCellViewModel) {
        self.viewModel = viewModel
        setupData()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

    // MARK: - setup Data
extension NewsCollectionViewCell {
    func setupData() {
        guard let viewModel else { return }

        // insert title article
        titleLabel.text = viewModel.title
        // downloaded image article
        if let imageUrl = viewModel.urlToImage {
            imageView.downloaded(from: imageUrl,
                                 contentMode: .scaleAspectFill)
        }
        // add round of corners articles
        imageView.roundCorners([.topLeft, .topRight], radius: 10)
        // insert author article
        authorLabel.text = String(format: "%@%@", "publishedBy".localized(), viewModel.author ?? "")
        // insert date article
        dateLabel.adjustsFontSizeToFitWidth = false
        dateLabel.lineBreakMode = .byTruncatingTail
        dateLabel.text = viewModel.getDate()
    }
}
