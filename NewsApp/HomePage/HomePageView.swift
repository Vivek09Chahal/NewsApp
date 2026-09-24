//
//  HomePage.swift
//  NewsApp
//
//  Created by Vivek on 12/09/26.
//

import SwiftUI

struct HomePage: View {
    
    @State var homePageViewModel: homePageVM = homePageVM()
    
    var body: some View {
        NavigationStack {
            VStack {
                HomePageHeaderView(homePageViewModel: homePageViewModel)
                    .padding(.vertical, 8)
                
                NewsCategoryView(viewModel: homePageViewModel)
                    .padding(.bottom, 8)
                
                if let errorMessage = homePageViewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundStyle(.secondary)
                        .padding(.top, 40)
                    Image("empty_filter_v3")
                } else {
                    ScrollView {
                        if homePageViewModel.isLoading {
                            NewsLoadingShimmer()
                        } else {
                            LazyVStack(alignment: .leading, spacing: 16) {
                                if homePageViewModel.articles.isEmpty {
                                    VStack {
                                        Image("empty_files_v3")
                                        Text("No Data Present")
                                            .font(.title3)
                                            .fontWeight(.bold)
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .containerRelativeFrame(.vertical, alignment: .center)
                                } else {
                                    ForEach(homePageViewModel.articles, id: \.url) { article in
                                        NewsContentView(
                                            imageURL: article.urlToImage,
                                            articleTitle: article.title,
                                            articleSourceName: article.source.name
                                        )
                                        .task {
                                            await homePageViewModel.loadMoreIfNeeded(currentArticle: article)
                                        }
                                    }
                                    .padding(.vertical, 4)
                                    
                                    if homePageViewModel.isLoadingMore {
                                        NewsLoadingShimmer()
                                    }
                                }
                            }
                        }
                    }
                    .refreshable {
                        try? await homePageViewModel.fetchTopHeadlines()
                    }
                    .task {
                        try? await homePageViewModel.fetchTopHeadlines()
                    }
                }
            }
        }
    }
}

#Preview {
    HomePage()
}
