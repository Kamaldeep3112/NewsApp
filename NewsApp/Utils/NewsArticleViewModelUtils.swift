//
//  NewsArticleViewModelUtils.swift
//  NewsApp
//
//  Created by Kamaldeep on 11/10/23.
//

import Foundation

struct NewsArticleViewModelUtils {

    static func newsArticleViewModel(_ newsResponseModel: NewsResponseModel) -> NewsArticleViewModel {
        var newsArticleCellViewModels = [NewsArticleCellViewModel]()
        for newsArticle in newsResponseModel.articles {
            let newsArticleCellViewModel = NewsArticleCellViewModel(
                sourceName: newsArticle.source.name,
                author: newsArticle.author ?? "",
                title: newsArticle.title,
                description: newsArticle.description ?? "",
                publishedAt: newsArticle.publishedAt,
                imageURLString: newsArticle.urlToImage ?? "",
                actionURLString: newsArticle.url)
            newsArticleCellViewModels.append(newsArticleCellViewModel)
        }

        return NewsArticleViewModel(newsArticles: newsArticleCellViewModels)
    }
}
