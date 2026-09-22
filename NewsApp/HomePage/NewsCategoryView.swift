//
//  NewsCategoryView.swift
//  NewsApp
//
//  Created by Vivek on 12/09/26.
//

import SwiftUI

struct NewsCategoryView: View {
    
    var viewModel: homePageVM
    @Namespace private var underlineNamespace
    
    init(viewModel: homePageVM) {
        self.viewModel = viewModel
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(newsCategories.allCases) { category in
                    Text(category.title)
                        .opacity(viewModel.selectedCategory == category ? 1 : 0.5)
                        .overlay(alignment: .bottom) {
                            if category == viewModel.selectedCategory {
                                Rectangle()
                                    .frame(height: 2)
                                    .foregroundStyle(.brown)
                                    .matchedGeometryEffect(id: "underline", in: underlineNamespace)
                            }
                        }
                        .onTapGesture {
                            withAnimation(.linear(duration: 0.3)) {
                                viewModel.selectedCategory = category
                            }
                        }
                        .padding(.leading, 8)
                }
            }
            .padding(.trailing, 8)
            .scrollTargetLayout()
        }
        .scrollPosition(id: .constant(viewModel.selectedCategory), anchor: .center)
    }
}

#Preview {
    NewsCategoryView(viewModel: homePageVM())
}
