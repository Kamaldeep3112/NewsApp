//
//  NewsArticleCellViewModel.swift
//  NewsApp
//
//  Created by Kamaldeep on 11/10/23.
//

import Foundation
import UIKit

class NewsArticleCellViewModel {
    let sourceName: String
    let author: String
    let title: String
    let description: String
    let publishedAt: String
    let actionURLString: String

    private let imageURLString: String

    init(sourceName: String,
         author: String,
         title: String,
         description: String,
         publishedAt: String,
         imageURLString: String,
         actionURLString: String) {
        self.sourceName = sourceName
        self.author = author
        self.title = title
        self.description = description
        self.publishedAt = publishedAt
        self.imageURLString = imageURLString
        self.actionURLString = actionURLString
    }

    func loadImage(completion: @escaping (UIImage) -> Void) {
        URLManager.getImage(urlString: imageURLString) { image in
            completion(image)
        }
    }
}
