//
//  TabView.swift
//  NewsApp
//
//  Created by Vivek on 14/09/26.
//

import SwiftUI

struct MainPage: View {
    
    @State private var searchText: String = ""
    @State private var selectedTab: Int = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            Tab(value: 0) {
                HomePage()
            } label: {
                Text("Local News")
                Image(systemName: "newspaper")
            }

            Tab(value: 1) {
                Text("World News")
            } label: {
                Text("Global News")
                Image(systemName: "globe")
            }

            Tab(value: 2) {
                Text("Archive")
            } label: {
                Text("Archive")
                Image(systemName: "archivebox")
            }
        }
        .tint(.blue)
    }
}

#Preview {
    MainPage()
}
