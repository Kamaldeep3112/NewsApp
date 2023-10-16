//
//  NewsArticleViewModel.swift
//  NewsApp
//
//  Created by Kamaldeep on 11/10/23.
//

import Foundation

class NewsArticleViewModel {

    private(set) var newsArticles: [NewsArticleCellViewModel]?

    var numberOfNews: Int {
        return newsArticles?.count ?? 0
    }

    func newsAt(index: Int) -> NewsArticleCellViewModel? {
        guard let newsArticles else {
            // Add assert code
            return nil
        }
        guard 0 <= index && index < numberOfNews else {
            // Add assert code
            return nil
        }
        return newsArticles[index]
    }

    func fetchNews(completion: @escaping () -> Void) {
        URLManager.getNewsData { [weak self] newsResponse in
            guard let strongSelf = self else {
                return
            }

            strongSelf.newsArticles = NewsArticleViewModelUtils.newsArticleViewModel(newsResponse)
            completion()
        }
    }
}
