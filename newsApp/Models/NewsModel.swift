//
//  NewsModel.swift
//  newsApp
//
//  Created by User on 20.10.21.
//

import Foundation

struct NewsModel: Codable {
    let title: String
    let description: String
    let url: URL?
    let urlToImage: String

    init(title: String, description: String, urlToImage: String, url: URL?) {
        self.title = title
        self.description = description
        self.urlToImage = urlToImage
        self.url = url
    }
}
