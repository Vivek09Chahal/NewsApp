//
//  urlBulding.swift
//  NewsApp
//
//  Created by Vivek on 13/09/26.
//

// country top headline: GET https://newsapi.org/v2/top-headlines?country=us&apiKey=38937b09cbd64bd4b7589c76f78be1aa
// channel headline: GET https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=38937b09cbd64bd4b7589c76f78be1aa
// country and category headline: GET https://newsapi.org/v2/top-headlines?country=de&category=business&apiKey=38937b09cbd64bd4b7589c76f78be1aa

import Foundation

enum NewsEndpoint {
    case topHeadlines(country: String, category: newsCategories? = nil)
//    case channelHeadlines(source: String, page: Int = 1, pageSize: Int = 10)
//    case search(query: String, page: Int = 1, pageSize: Int = 10)
//    case sources(category: newsCategories? = nil, country: String? = nil, language: String? = nil)

    private var apiKey: String { "38937b09cbd64bd4b7589c76f78be1aa" }

    var path: String {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "newsapi.org"

        var items = [URLQueryItem]()

        switch self {
        case .topHeadlines(let country, let category):
            components.path = "/v2/top-headlines"
            items.append(.init(name: "country", value: country))
            if let category, category != .all {
                items.append(.init(name: "category", value: category.rawValue))
            }
        }

        // Appending apiKey at the end
        items.append(.init(name: "apiKey", value: apiKey))

        components.queryItems = items
        return components.string ?? ""
    }
}
