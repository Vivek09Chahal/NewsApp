//
//  newsContent.swift
//  NewsApp
//
//  Created by Vivek on 9/21/26.
//

import SwiftUI
import Kingfisher

struct NewsContentView: View {

    let imageURL: String?
    let articleTitle: String
    let articleSourceName: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.white)
                .shadow(radius: 5)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(articleSourceName)
                        .font(.caption)
                        .fontDesign(.serif)
                    
                    Text(articleTitle)
                }
                .padding(.horizontal, 4)
                
                Spacer()
                
                if let imageURL,
                   let url = URL(string: imageURL) {
                    
                    KFImage(url)
                        .placeholder {
                            ImageShimmerView()
                        }
                        .resizable()
                        .frame(width: 125, height: 125)
                        .scaledToFill()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                } else {
                    ImageShimmerView()
                }
            }
            .padding(7)
        }
        .padding(.horizontal, 8)
    }
}

#Preview {
    NewsContentView(
        imageURL: "https://i.pinimg.com/736x/6c/aa/c6/6caac61ce74c30c53c76841ba1799d9a.jpg",
        articleTitle: "Vivek",
        articleSourceName: "Anything"
    )
}
