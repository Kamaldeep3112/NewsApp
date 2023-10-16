//
//  ViewController.swift
//  NewsApp
//
//  Created by Kamaldeep on 11/10/23.
//

import UIKit

class ViewController: UIViewController {

    private let articleListTableView = UITableView()

    // TODO: Use DependencyInjection, Create a protocol and take this view model from outside
    private var viewModel: NewsArticleViewModel = NewsArticleViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.fetchNews { [weak self] in
            DispatchQueue.main.async {
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
        return viewModel.numberOfNews
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let newsCell = tableView.dequeueReusableCell(withIdentifier: "NewsArticle", for: indexPath) as? NewsArticleCell,
              let cellViewModel = viewModel.newsAt(index: indexPath.row) else {
            return UITableViewCell()
        }

        newsCell.configure(viewModel: cellViewModel)
        return newsCell
    }
}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cellViewModel = viewModel.newsAt(index: indexPath.row) else {
            return
        }

        let detailViewController = NewsDetailViewController(urlString: cellViewModel.actionURLString)
        show(detailViewController, sender: self)
    }
}
