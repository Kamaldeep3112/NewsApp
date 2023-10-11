//
//  NewsArticleModel.swift
//  NewsApp
//
//  Created by Kamaldeep on 11/10/23.
//

import Foundation

struct NewsArticleModel: Codable {
    let source: SourceModel
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}
