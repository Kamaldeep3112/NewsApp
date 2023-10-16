//
//  ViewController.swift
//  NewsApp
//
//  Created by Kamaldeep on 11/10/23.
//

import UIKit

class ViewController: UIViewController {

    private let articleListTableView = UITableView()

    private var viewModel: NewsArticleViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        URLManager.getNewsData { [weak self] newsResponse in
            guard let strongSelf = self else {
                return
            }
            strongSelf.viewModel = NewsArticleViewModelUtils.newsArticleViewModel(newsResponse)
            DispatchQueue.main.async { [weak self] in
                self?.articleListTableView.reloadData()
            }
        }
        setupUI()
    }

    // MARK: Private Methods

    private func setupUI() {
        setupArticleList()
    }

    private func setupArticleList() {
        articleListTableView.register(NewsArticleCell.self, forCellReuseIdentifier: "NewsArticle")
        articleListTableView.separatorStyle = .singleLine
        articleListTableView.dataSource = self
        articleListTableView.delegate = self

        articleListTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(articleListTableView)

        NSLayoutConstraint.activate([
            articleListTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            articleListTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            articleListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            articleListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.newsArticles.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let newsCell = tableView.dequeueReusableCell(withIdentifier: "NewsArticle", for: indexPath) as? NewsArticleCell,
              let viewModel else {
            return UITableViewCell()
        }

        newsCell.configure(viewModel: viewModel.newsArticles[indexPath.row])
        return newsCell
    }
}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cellViewModel = viewModel?.newsArticles[indexPath.row] else {
            return
        }

        let detailViewController = NewsDetailViewController(urlString: cellViewModel.actionURLString)
        show(detailViewController, sender: self)
    }
}
