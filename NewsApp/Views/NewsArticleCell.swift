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

    private var viewModel: NewsArticleCellViewModel?
    private var stackView = UIStackView()
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
    }

    // MARK: - Private Methods

    private func setupUI() {
        setupStackView()

        // We can move these to there respective methods for setup
        sourceLabel.font = UIFont.systemFont(ofSize: 12)
        stackView.addArrangedSubview(sourceLabel)
        customConstraints.append(sourceLabel.heightAnchor.constraint(equalToConstant: 14))

        authorLabel.font = UIFont.systemFont(ofSize: 12)
        stackView.addArrangedSubview(authorLabel)
        customConstraints.append(authorLabel.heightAnchor.constraint(equalToConstant: 14))

        titleLabel.font = UIFont.systemFont(ofSize: 12)
        stackView.addArrangedSubview(titleLabel)
        customConstraints.append(titleLabel.heightAnchor.constraint(equalToConstant: 14))

        descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        stackView.addArrangedSubview(descriptionLabel)
        customConstraints.append(descriptionLabel.heightAnchor.constraint(equalToConstant: 50))

        publishedAtLabel.font = UIFont.systemFont(ofSize: 12)
        stackView.addArrangedSubview(publishedAtLabel)
        customConstraints.append(publishedAtLabel.heightAnchor.constraint(equalToConstant: 14))

        NSLayoutConstraint.activate(customConstraints)
    }

    private func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 10

        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        customConstraints.append(contentsOf: [
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
