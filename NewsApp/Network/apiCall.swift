//
//  network.swift
//  NewsApp
//
//  Created by Vivek on 12/09/26.
//

// Search: GET https://newsapi.org/v2/everything?q=Apple&from=2026-09-12&sortBy=popularity&apiKey=38937b09cbd64bd4b7589c76f78be1aa
// headlines: GET https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=38937b09cbd64bd4b7589c76f78be1aa
// country top headline: GET https://newsapi.org/v2/top-headlines?country=us&apiKey=38937b09cbd64bd4b7589c76f78be1aa
// channel headline: GET https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=38937b09cbd64bd4b7589c76f78be1aa
// country and category headline: GET https://newsapi.org/v2/top-headlines?country=de&category=business&apiKey=38937b09cbd64bd4b7589c76f78be1aa

// categories: Find sources that display news of this category. Possible options: business| entertainment | general | health | science | sports | technology. Default: all categories.
// language: Find sources that display news in a specific language. Possible options: ar | de | en | es | fr | he | it | nl | no | pt | ru | sv | ud | zh. Default: all languages.
// country: Find sources that display news in a specific country. Possible options: ae |  ar | at | au | be | bg | br | ca | ch | cn | co | cu | cz | de | eg | fr | gb | gr | hk | hu | id | ie | il | in | it | jp | kr | lt | lv | ma | mx | my | ng | nl | no | nz | ph | pl | pt | ro | rs | ru | sa | se | sg | si | sk | th | tr | tw | ua | us | ve | za. Default: all countries.


import Foundation

class Network {
    
    func urlResut<T: Decodable>(for urlString: String) async throws -> T {
        print("Fetching URL: \(urlString)")
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }

        // Check for non-200 HTTP status codes and log NewsAPI error response
        guard (200...299).contains(httpResponse.statusCode) else {
            if let errorJSON = try? JSONSerialization.jsonObject(with: data) {
                print("⚠️ NewsAPI Error (\(httpResponse.statusCode)):", errorJSON)
            } else if let errorString = String(data: data, encoding: .utf8) {
                print("⚠️ NewsAPI Error (\(httpResponse.statusCode)):", errorString)
            }
            throw URLError(.badServerResponse)
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        return try decoder.decode(T.self, from: data)
    }
}
