//
//  homePageVM.swift
//  NewsApp
//
//  Created by Vivek on 13/09/26.
//

import Foundation

@Observable
class homePageVM {

    var country: String = "us"
    private let network = Network()
    private let pageSize = 10

    var selectedCategory: newsCategories = .all {
        didSet {
            guard oldValue != selectedCategory else { return }
            Task { await fetchTopHeadlines() }
        }
    }
    
    var articles: [Article] = []
    var isLoading: Bool = false
    var isLoadingMore: Bool = false
    var errorMessage: String?

    private var currentPage = 1
    private var totalResults = 0

    private var canLoadMorePages: Bool {
        articles.count < totalResults
    }

    @MainActor
    func fetchTopHeadlines() async {
        isLoading = true
        errorMessage = nil
        currentPage = 1

        do {
            let endpoint = NewsEndpoint.topHeadlines(country: country, category: selectedCategory)
            let result: Articles = try await network.urlResut(for: endpoint.path)
            articles = result.articles
            totalResults = result.totalResults
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }

    @MainActor
    func loadMoreIfNeeded(currentArticle article: Article) async {
        guard article.url == articles.last?.url else { return }
        guard !isLoadingMore, canLoadMorePages else { return }

        isLoadingMore = true
        currentPage += 1
  
        do {
            let endpoint = NewsEndpoint.topHeadlines(country: country, category: selectedCategory)
            let result: Articles = try await network.urlResut(for: endpoint.path)
            articles.append(contentsOf: result.articles)
            totalResults = result.totalResults
        } catch {
            currentPage -= 1
        }

        isLoadingMore = false
    }
}
