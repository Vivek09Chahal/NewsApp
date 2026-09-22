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
            VStack{
                HomePageHeaderView(homePageViewModel: homePageViewModel)
                    .padding(.vertical, 8)
                
                NewsCategoryView(viewModel: homePageViewModel)
                    .padding(.bottom, 8)
                
                ScrollView {
                    if homePageViewModel.isLoading {
                        ProgressView()
                            .padding(.top, 40)
                    } else if let errorMessage = homePageViewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundStyle(.secondary)
                            .padding(.top, 40)
                    } else {
                        LazyVStack(alignment: .leading, spacing: 16) {
                            if homePageViewModel.articles.isEmpty {
                                Text("No Data Present")
                            } else {
                                ForEach(homePageViewModel.articles, id: \.url) { article in
                                    NewsContentView(imageURL: article.urlToImage, articleTitle: article.title, articleSourceName: article.source.name)
                                        .task {
                                            await homePageViewModel.loadMoreIfNeeded(currentArticle: article)
                                        }
                                }
                                .padding(.vertical, 4)
                                
                                if homePageViewModel.isLoadingMore {
                                    ProgressView()
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 12)
                                }
                            }
                        }
                    }
                }
            }
            .task {
                await homePageViewModel.fetchTopHeadlines()
            }
        }
    }
}

#Preview {
    HomePage()
}
