//
//  newsModel.swift
//  NewsApp
//
//  Created by Vivek on 12/09/26.
//

import Foundation

/*
     {
        "status": "ok",
        "totalResults": 676,
        -"articles": [
        -{
        -"source": {
        "id": null,
        "name": "MacRumors"
        },
        "author": "Tim Hardwick",
        "title": "How to Pre-Order Your iPhone 18 Pro From Apple",
        "description": "Apple unveiled the iPhone 18 Pro and iPhone 18 Pro Max on September 9 at its \"Surprise and shine\" event. If you're keen to be among the first to get your hands on one, here are some tips on how to give yourself the best chance. If you're looking to grab a fol…",
        "url": "https://www.macrumors.com/how-to/pre-order-your-iphone-18-pro-from-apple/",
        "urlToImage": "https://images.macrumors.com/t/_U_WeOCxgqTR33NcWIoeDd9tUfw=/2500x/article-new/2026/09/Apple-iPhone-18-Pro-color-lineup-16x9-1.jpg",
        "publishedAt": "2026-09-12T03:22:05Z",
        "content": "Apple unveiled the iPhone 18 Pro and iPhone 18 Pro Max on September 9 at its \"Surprise and shine\" event. If you're keen to be among the first to get your hands on one, here are some tips on how to gi… [+4011 chars]"
        },
        -{
        -"source": {
        "id": null,
        "name": "MacRumors"
        },
        "author": "Joe Rossignol",
        "title": "Didn't Pre-Order iPhone 18 Pro Yet? Here's How Long the Wait is Now",
        "description": "iPhone 18 Pro and iPhone 18 Pro Max pre-orders began today in the U.S. and many other countries. If you have yet to place a pre-order on Apple's online store, you might face a longer wait now, depending on your desired configuration.\n\n\n\n\n\nThe first customers …",
        "url": "https://www.macrumors.com/2026/09/12/iphone-18-pro-max-pre-order-shipping-dates/",
        "urlToImage": "https://images.macrumors.com/t/mmRniwIKsV_uY6ASlk3p-tjw_t4=/1600x/article-new/2026/09/iPhone-18-Pro-Black.jpg",
        "publishedAt": "2026-09-12T13:48:45Z",
        "content": "iPhone 18 Pro and iPhone 18 Pro Max pre-orders began today in the U.S. and many other countries. If you have yet to place a pre-order on Apple's online store, you might face a longer wait now, depend… [+1673 chars]"
        }
     }
*/
struct Articles: Codable {
    let totalResults: Int
    let articles: [Article]
    
    enum CodingKeys: String, CodingKey {
        case totalResults, articles
    }
}

struct Article: Codable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
    
    enum CodingKeys: String, CodingKey {
        case source, author, title, description, url, urlToImage, publishedAt, content 
    }
}

struct Source: Codable {
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}


