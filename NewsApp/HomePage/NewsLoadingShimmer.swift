//
//  NewsLoadingShimmer.swift
//  NewsApp
//
//  Created by Vivek on 23/09/26.
//

import SwiftUI

struct NewsLoadingShimmer: View {
    var body: some View {
        ForEach(0..<8){ _ in
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.3))
                .frame(height: 125)
                .shimmer(
                    gradient: Gradient(colors: [
                        .gray.opacity(0.3),
                        .gray.opacity(0.5),
                        .gray.opacity(0.3)
                    ])
                )
                .padding(.horizontal, 8)
        }
    }
}

#Preview {
    NewsLoadingShimmer()
}
