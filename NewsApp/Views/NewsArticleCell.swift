//
//  NewsArticleCell.swift
//  NewsApp
//
//  Created by Kamaldeep on 11/10/23.
//

import UIKit

class NewsArticleCell: UITableViewCell {

    private var viewModel: NewsArticleCellViewModel?

    private let sourceLabel = UILabel()
    private let authorLabel = UILabel()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let publishedAtLabel = UILabel()
    private let articleImageView = UIImageView()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(viewModel: NewsArticleCellViewModel) {
        self.viewModel = viewModel
        // Add data to subviews using `viewModel`
    }

    // MARK: - Private Methods

    func setupUI() {
        // Setup Initial UI which is fixed for all cells
    }
}
