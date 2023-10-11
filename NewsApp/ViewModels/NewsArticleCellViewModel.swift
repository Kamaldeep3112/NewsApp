//
//  NewsArticleCellViewModel.swift
//  NewsApp
//
//  Created by Temp-Kamaldeep on 11/10/23.
//

import Foundation

class NewsArticleCellViewModel {
    let sourceName: String
    let author: String
    let title: String
    let description: String
    let publishedAt: String
    let imageURLString: String
    let actionURLString: String

    init(sourceName: String, author: String, title: String, description: String, publishedAt: String, imageURLString: String, actionURLString: String) {
        self.sourceName = sourceName
        self.author = author
        self.title = title
        self.description = description
        self.publishedAt = publishedAt
        self.imageURLString = imageURLString
        self.actionURLString = actionURLString
    }
}
