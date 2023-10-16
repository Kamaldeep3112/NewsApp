//
//  NewsArticleCell.swift
//  NewsApp
//
//  Created by Kamaldeep on 11/10/23.
//

import UIKit

class NewsArticleCell: UITableViewCell {

    private let sourceLabel = UILabel()
    private let authorLabel = UILabel()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let publishedAtLabel = UILabel()
    private let articleImageView = UIImageView()

    private let verticalStackView = UIStackView()

    private var viewModel: NewsArticleCellViewModel?
    private var customConstraints = [NSLayoutConstraint]()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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
        sourceLabel.text = viewModel.sourceName
        authorLabel.text = viewModel.author
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        publishedAtLabel.text = viewModel.publishedAt

        viewModel.loadImage { [weak self] image in
            DispatchQueue.main.async {
                self?.articleImageView.image = image
            }
        }
    }

    // MARK: - Private Methods

    private func setupUI() {
        selectionStyle = .none
        setupVerticalStackView()
        NSLayoutConstraint.activate(customConstraints)
    }

    private func setupVerticalStackView() {
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 10
        layer.borderWidth = 2

        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(verticalStackView)
        customConstraints.append(contentsOf: [
            verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        // Setup Subviews

        // TODO: Move these to there respective methods for setup
        articleImageView.contentMode = .scaleAspectFit
        customConstraints.append(articleImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 150))
        verticalStackView.addArrangedSubview(articleImageView)

        sourceLabel.font = UIFont.systemFont(ofSize: 12)
        verticalStackView.addArrangedSubview(sourceLabel)

        authorLabel.font = UIFont.systemFont(ofSize: 12)
        verticalStackView.addArrangedSubview(authorLabel)

        titleLabel.font = UIFont.systemFont(ofSize: 12)
        verticalStackView.addArrangedSubview(titleLabel)

        descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        descriptionLabel.numberOfLines = 0
        verticalStackView.addArrangedSubview(descriptionLabel)

        publishedAtLabel.font = UIFont.systemFont(ofSize: 12)
        verticalStackView.addArrangedSubview(publishedAtLabel)
    }
}
