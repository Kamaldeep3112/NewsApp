//
//  URLManager.swift
//  NewsApp
//
//  Created by Kamaldeep on 11/10/23.
//

import Foundation

class URLManager {

    private static let apiKey = "41215f89b5eb48c2a3ccb1c9909e017b"
    private static let baseURL = "https://newsapi.org/v2/top-headlines"
    private static let cache = URLCache.shared

    private static let jsonDecoder = JSONDecoder()

    static func getNewsData(completion: @escaping (NewsResponseModel) -> Void) {
        if let cachedData = checkCache() {
            completion(cachedData)
            return
        }

        // Create the URL for the API request
        // TODO: Refactor it and make it generic
        if let url = URL(string: "\(baseURL)?country=us&apiKey=\(apiKey)") {

            // Create a URLSession configuration
            let config = URLSessionConfiguration.default

            // Create a URLSession with the shared configuration
            let session = URLSession(configuration: config)

            // Create a data task
            let task = session.dataTask(with: url) { (data, response, error) in
                guard let data else {
                    if let error {
                        print("Error: \(error)")
                    }
                    print("Unkown error occured")
                    return
                }
                do {
                    // Parse the JSON data
                    let newsResponse = try jsonDecoder.decode(NewsResponseModel.self, from: data)

                    // Handle the parsed data
                    completion(newsResponse)
                } catch {
                    print("Error parsing JSON: \(error)")
                }
            }

            // Start the data task
            task.resume()
        }
    }

    // MARK: - Private Helpers

    private static func checkCache() -> NewsResponseModel? {
        guard let newsAPIURL = URL(string: "\(baseURL)?country=us&apiKey=\(apiKey)"),
              let cachedResponse = cache.cachedResponse(for: URLRequest(url: newsAPIURL)) else {
            return nil
        }

        do {
            // Parse the JSON data
            return try jsonDecoder.decode(NewsResponseModel.self, from: cachedResponse.data)
        } catch {
            print("Error parsing JSON: \(error)")
        }
        return nil
    }
}
