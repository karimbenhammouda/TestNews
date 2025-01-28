//
//  NewsAuthorView.swift
//  News
//
//  Created by karim BEN HAMMOUDA on 27/01/2025.
//

import Foundation
import UIKit

class NewsAuthorView: UIView {
    
    // MARK: - Properties
    var viewModel: NewsAuthorViewModel?
    
    // MARK: - @IBOutlet
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("NewsAuthorView", owner: self, options: nil)
        contentView.fixInView(self)
    }
    
    func setupData() {
        guard let viewModel else { return }
        
        authorLabel.text = String(format: "%@%@%@", "publishedBy".localized(), "\n", viewModel.author ?? "")
        dateLabel.text = viewModel.getDate()
    }
}
