//
//  NewsType.swift
//  NewsApp
//
//  Created by Vivek on 22/09/26.
//

import SwiftUI

struct NewsType: View {
    
    var newsTypeString: String
    
    var body: some View {
        HStack {
            ZStack {
                Capsule()
                    .foregroundStyle(.pale)
                    .frame(height: 50)
                    .shadow(radius: 5)
                    .padding(8)
                
                Text(newsTypeString)
            }
        }
    }
}

#Preview {
    NewsType(newsTypeString: "Top-Headlines")
}
