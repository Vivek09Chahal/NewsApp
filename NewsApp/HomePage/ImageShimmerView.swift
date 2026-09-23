//
//  ImageShimmerView.swift
//  NewsApp
//
//  Created by Vivek on 22/09/26.
//

import SwiftUI

struct ImageShimmerView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.gray.opacity(0.3))
            .frame(width: 130, height: 130)
            .shimmer(
                gradient: Gradient(colors: [
                    .gray.opacity(0.3),
                    .gray.opacity(0.5),
                    .gray.opacity(0.3)
                ])
            )
    }
}

#Preview {
    ImageShimmerView()
}
